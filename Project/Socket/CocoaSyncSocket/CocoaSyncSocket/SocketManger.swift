//
//  SocketManger.swift
//  CocoaSyncSocket
//
//  Created by yang on 2019/7/2.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import Foundation
import CocoaAsyncSocket
class SocketManger: NSObject {
    static let Khost = "127.0.0.1"
    static let Kport: UInt16  = 6969
    var gcdSocket: GCDAsyncSocket? = nil
    
    static let share:SocketManger = {
        let manger = SocketManger.init()
        manger.instanceSocket()
        return manger
    }()
    
   fileprivate func instanceSocket() {
        gcdSocket = GCDAsyncSocket.init(delegate: self, delegateQueue: DispatchQueue.main)

    }
    
    //MARK: 公开的方法
    public func connect() {
       try? gcdSocket?.connect(toHost: SocketManger.Khost, onPort: SocketManger.Kport)
    }
    
    public func disConnect() {
        gcdSocket?.disconnect()
    }
    
    public func sendMsg(message: String) {
        guard let data = message.data(using: .utf8)else{return}
        gcdSocket?.write(data, withTimeout: -1, tag: 110)
    }
    
    //监听最新的消息
    fileprivate func pullTheMsg() {
        gcdSocket?.readData(withTimeout: -1, tag: 110)
    }
    //用Pingpong机制来看是否有反馈
    fileprivate func checkPingPong() {
        gcdSocket?.readData(withTimeout: 3, tag: 110)
    }
}

extension SocketManger:GCDAsyncSocketDelegate {
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("连接成功，host:\(host),port\(port)")
        self.checkPingPong()
    }
    
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print("断开连接了，host:\(sock.localHost ?? "未发现端口"),port\(sock.localPort)")

    }
    
    
    func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        print("写入数据的回调tag\(tag)")
         //判断是否成功发送，如果没收到响应，则说明连接断了，则想办法重连
        self.checkPingPong()
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        let str = String.init(data: data, encoding: .utf8)
        print("收到消息\(str!)")
        self.pullTheMsg()
    }
    
}
