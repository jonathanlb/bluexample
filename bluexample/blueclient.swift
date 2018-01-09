//
//  Handle callbacks around scanning for BluetoothLE periphials.
//  Print discovery to console.
//
//  Created by Jonathan Bredin on 1/7/18.
//  Copyright © 2018 Jonathan Bredin. All rights reserved.
//

import CoreBluetooth

class BlueClient: NSObject {
  var centralManager: CBCentralManager!
  
  let bluetoothScanOptions = [
    CBCentralManagerScanOptionAllowDuplicatesKey: false]
  
  override init() {
    super.init()
    let bt_queue = DispatchQueue(label: "BT_queue")// queue must be non-nil
    centralManager = CBCentralManager(delegate: self, queue: bt_queue)
    NSLog("created central manager scanning")
  }
}

extension BlueClient: CBCentralManagerDelegate {
  func centralManager(_ central: CBCentralManager,
                      didConnect peripheral: CBPeripheral)
  {
    NSLog("centralManager connect %@", peripheral)
  }
  
  func centralManager(_ central: CBCentralManager,
                      didDiscover peripheral: CBPeripheral,
                      advertisementData: [String : Any],
                      rssi RSSI: NSNumber)
  {
    NSLog("centralManager discovered %@ with %@ rssi %@", peripheral, advertisementData, RSSI)
  }
  
  func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
    NSLog("failed")
  }
  
  func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
    NSLog("disconnect")
  }
  
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch (central.state) {
    case .poweredOff:
      NSLog("Powered Off")
    case .poweredOn:
      NSLog("Powered On")
      centralManager.scanForPeripherals(withServices: nil, options: bluetoothScanOptions)
      NSLog("scanning: %@", centralManager.isScanning.description)
    case .unauthorized:
      NSLog("Unauthorized")
    case .unknown:
      NSLog("Unknown")
    case .unsupported:
      NSLog("Unsupported")
    default:
      NSLog("Default")
    }
  }
}
