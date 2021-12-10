# Dictionary mapping palIDs to palette colours.

sharedDict = {
  "trans": b'\x55\x53',
  "white": b'\xFF\x7F',
  "outline": b'\xA5\x14'
}
ghostSharedDict = {
  "wep2_1": b'\x59\x21',
  "wep2_2": b'\xD4\x14',
  "wep3_1": b'\x9F\x4A',
  "wep3_2": b'\xFC\x31',
  "wep3_3": b'\x59\x21',
  "wep4_1": b'\x9F\x4A',
  "wep4_2": b'\xFC\x31',
  "wep4_3": b'\x59\x21',
  "wep4_4": b'\xD4\x14',
  "armour4_1": b'\x77\x62',
  "armour4_2": b'\xB1\x49',
  "armour4_3": b'\x4D\x35',
  "armour4_4": b'\x09\x2D',
  "armour3_1": b'\xB1\x49',
  "armour3_2": b'\x4D\x35',
  "armour3_3": b'\x09\x2D'
}
humanSharedDict = {
  "wep2_1": b'\xF8\x6E',
  "wep2_2": b'\xED\x51',
  "wep3_1": b'\x7B\x77',
  "wep3_2": b'\xF8\x6E',
  "wep3_3": b'\xED\x51',
  "wep4_1": b'\xFF\x7F',
  "wep4_2": b'\x7B\x77',
  "wep4_3": b'\xF8\x6E',
  "wep4_4": b'\xED\x51',
  "underw3_1": b'\xF3\x4D',
  "underw3_2": b'\x6F\x3D',
  "underw3_3": b'\x0C\x31'
}
enemySharedDict = {
  "armour4_1": b'\x9F\x42',
  "armour4_2": b'\x7B\x21',
  "armour4_3": b'\xB1\x14',
  "armour4_4": b'\x4A\x10',
  "armour3_1": b'\x3A\x18',
  "armour3_2": b'\x53\x14',
  "armour3_3": b'\x6B\x14'
}
neutralSharedDict = {
  "armour4_1": b'\xB5\x4F',
  "armour4_2": b'\xCB\x2E',
  "armour4_3": b'\xE7\x21',
  "armour4_4": b'\x25\x19',
  "armour3_1": b'\x68\x27',
  "armour3_2": b'\xA7\x22',
  "armour3_3": b'\x07\x22'
}

ghostDict1 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\xD7\x77',
  "skin4_2": b'\x32\x63',
  "skin4_3": b'\x6E\x4A',
  "skin4_4": b'\x48\x25',
  "underw3_1": b'\x96\x2A',
  "underw3_2": b'\x8E\x15',
  "underw3_3": b'\xA7\x08'
}
ghostDict1 = {**ghostDict1, **sharedDict.copy()}
ghostDict1 = {**ghostDict1, **ghostSharedDict.copy()}

ghostDict2 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\xBE\x5F',
  "skin4_2": b'\x19\x4B',
  "skin4_3": b'\x53\x3A',
  "skin4_4": b'\x2A\x21',
  "underw3_1": b'\xCF\x4E',
  "underw3_2": b'\x4B\x42',
  "underw3_3": b'\x25\x1D'
}
ghostDict2 = {**ghostDict2, **sharedDict.copy()}
ghostDict2 = {**ghostDict2, **ghostSharedDict.copy()}

ghostDict3 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\x7B\x6F',
  "skin4_2": b'\x73\x4E',
  "skin4_3": b'\x8C\x31',
  "skin4_4": b'\xE7\x1C',
  "underw3_1": b'\x39\x33',
  "underw3_2": b'\x73\x1E',
  "underw3_3": b'\xAD\x0D'
}
ghostDict3 = {**ghostDict3, **sharedDict.copy()}
ghostDict3 = {**ghostDict3, **ghostSharedDict.copy()}

ghostDict4 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\x5F\x6F',
  "skin4_2": b'\xBC\x5A',
  "skin4_3": b'\x36\x46',
  "skin4_4": b'\x30\x21',
  "underw3_1": b'\x6F\x4E',
  "underw3_2": b'\xEB\x3D',
  "underw3_3": b'\x88\x31'
}
ghostDict4 = {**ghostDict4, **sharedDict.copy()}
ghostDict4 = {**ghostDict4, **ghostSharedDict.copy()}

enemyDict1 = {
  "hair3_1": b'\x12\x46',
  "hair3_2": b'\x4D\x31',
  "hair3_3": b'\xC9\x20',
  "skin4_1": b'\xFF\x6B',
  "skin4_2": b'\x1F\x4B',
  "skin4_3": b'\x18\x2A',
  "skin4_4": b'\x2E\x19'
}
enemyDict1 = {**enemyDict1, **sharedDict.copy()}
enemyDict1 = {**enemyDict1, **humanSharedDict.copy()}
enemyDict1 = {**enemyDict1, **enemySharedDict.copy()}

enemyDict2 = {
  "hair3_1": b'\x5F\x22',
  "hair3_2": b'\x98\x1D',
  "hair3_3": b'\xF2\x18',
  "skin4_1": b'\x5D\x47',
  "skin4_2": b'\xBA\x42',
  "skin4_3": b'\x97\x21',
  "skin4_4": b'\xF2\x0C'
}
enemyDict2 = {**enemyDict2, **sharedDict.copy()}
enemyDict2 = {**enemyDict2, **humanSharedDict.copy()}
enemyDict2 = {**enemyDict2, **enemySharedDict.copy()}

enemyDict3 = {
  "hair3_1": b'\x6D\x4B',
  "hair3_2": b'\x2A\x26',
  "hair3_3": b'\x47\x11',
  "skin4_1": b'\xDF\x3A',
  "skin4_2": b'\x18\x2A',
  "skin4_3": b'\x2E\x19',
  "skin4_4": b'\x89\x04'
}
enemyDict3 = {**enemyDict3, **sharedDict.copy()}
enemyDict3 = {**enemyDict3, **humanSharedDict.copy()}
enemyDict3 = {**enemyDict3, **enemySharedDict.copy()}

enemyDict4 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\xF5\x31',
  "skin4_2": b'\x93\x25',
  "skin4_3": b'\x30\x15',
  "skin4_4": b'\xCC\x08'
}
enemyDict4 = {**enemyDict4, **sharedDict.copy()}
enemyDict4 = {**enemyDict4, **humanSharedDict.copy()}
enemyDict4 = {**enemyDict4, **enemySharedDict.copy()}

neutralDict1 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\xFF\x6B',
  "skin4_2": b'\x1F\x4B',
  "skin4_3": b'\x18\x2A',
  "skin4_4": b'\x2E\x19'
}
neutralDict1 = {**neutralDict1, **sharedDict.copy()}
neutralDict1 = {**neutralDict1, **humanSharedDict.copy()}
neutralDict1 = {**neutralDict1, **neutralSharedDict.copy()}

neutralDict2 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\x5D\x47',
  "skin4_2": b'\xBA\x42',
  "skin4_3": b'\x97\x21',
  "skin4_4": b'\xF2\x0C'
}
neutralDict2 = {**neutralDict2, **sharedDict.copy()}
neutralDict2 = {**neutralDict2, **humanSharedDict.copy()}
neutralDict2 = {**neutralDict2, **neutralSharedDict.copy()}

neutralDict3 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\xDF\x3A',
  "skin4_2": b'\x18\x2A',
  "skin4_3": b'\x2E\x19',
  "skin4_4": b'\x89\x04'
}
neutralDict3 = {**neutralDict3, **sharedDict.copy()}
neutralDict3 = {**neutralDict3, **humanSharedDict.copy()}
neutralDict3 = {**neutralDict3, **neutralSharedDict.copy()}

neutralDict4 = {
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin4_1": b'\xF5\x31',
  "skin4_2": b'\x93\x25',
  "skin4_3": b'\x30\x15',
  "skin4_4": b'\xCC\x08'
}
neutralDict4 = {**neutralDict4, **sharedDict.copy()}
neutralDict4 = {**neutralDict4, **humanSharedDict.copy()}
neutralDict4 = {**neutralDict4, **neutralSharedDict.copy()}

miloDict = {
  "skin4_1": b'\xFF\x6B',
  "skin4_2": b'\x1F\x4B',
  "skin4_3": b'\x18\x2A',
  "skin4_4": b'\x2E\x19',
  "skin3_1": b'\xFF\x6B',
  "skin3_2": b'\x5F\x43',
  "skin3_3": b'\x91\x25',
  "armour4_1": b'\xD4\x6B',
  "armour4_2": b'\x0F\x53',
  "armour4_3": b'\x4A\x46',
  "armour4_4": b'\x86\x21',
  "armour3_1": b'\x50\x57',
  "armour3_1": b'\x8C\x46',
  "armour3_1": b'\x86\x21',
  "hair2_1": b'\x77\x2B',
  "hair2_2": b'\x2D\x26',
  "hair3_1": b'\xFC\x3B',
  "hair3_2": b'\x34\x17',
  "hair3_3": b'\xCB\x19',
  "hair4_1": b'\xF2\x77',
  "hair4_2": b'\x49\x5F',
  "hair4_3": b'\x80\x3E',
  "hair4_4": b'\x84\x25',
  "trim4_1": b'\xF2\x77',
  "trim4_2": b'\x49\x5F',
  "trim4_3": b'\x80\x3E',
  "trim4_4": b'\x84\x25',
  "underw3_1": b'\xBD\x56',
  "underw3_2": b'\x17\x42',
  "underw3_3": b'\x0C\x19',
  "highlight2_1": b'\x66\x6F',
  "highlight2_2": b'\x25\x6A'
}
miloDict = {**miloDict, **sharedDict.copy()}

leonaDict = {
  "skin2_1": b'\xFF\x6B',
  "skin2_2": b'\x1F\x4B',
  "skin3_1": b'\xFF\x6B',
  "skin3_2": b'\x1F\x4B',
  "skin3_3": b'\x2E\x19',
  "skin4_1": b'\xFF\x6B',
  "skin4_2": b'\x1F\x4B',
  "skin4_3": b'\x18\x2A',
  "skin4_4": b'\x2E\x19',
  "skin5_1": b'\xFF\xF6',
  "skin5_2": b'\xB1\xD4',
  "skin5_3": b'\x75\xA3',
  "skin5_4": b'\x2D\x62',
  "skin5_5": b'\xE7\x01',
  "armour3_1": b'\xFD\x68',
  "armour3_2": b'\xD6\x50',
  "armour3_3": b'\xAD\x30',
  "armour4_1": b'\x9F\x7E',
  "armour4_2": b'\xFA\x74',
  "armour4_3": b'\x71\x4C',
  "armour4_4": b'\x6A\x2C',
  "hair2_1": b'\x1A\xC7',
  "hair2_2": b'\x1C\x54',
  "hair3_1": b'\xAF\x7D',
  "hair3_2": b'\xE6\x64',
  "hair3_3": b'\x83\x40',
  "hair4_1": b'\xDF\x66',
  "hair4_2": b'\xBF\x45',
  "hair4_3": b'\x39\x21',
  "hair4_4": b'\x90\x0C',
  "trim4_1": b'\xDF\x66',
  "trim4_2": b'\xBF\x45',
  "trim4_3": b'\x39\x21',
  "trim4_4": b'\x90\x0C',
  "wep3_1": b'\xB9\x7B',
  "wep3_2": b'\x14\x73',
  "wep3_3": b'\x6F\x5E',
  "wep2_1": b'\x77\x7F',
  "wep2_2": b'\x6F\x5E',
  "underw3_1": b'\x5A\x53',
  "underw3_2": b'\xB5\x42',
  "underw3_3": b'\xD0\x29'
}
leonaDict = {**leonaDict, **sharedDict.copy()}

dict = [
  ghostDict1, ghostDict2, ghostDict3, ghostDict4,
  enemyDict1, enemyDict2, enemyDict3, enemyDict4,
  neutralDict1, neutralDict2, neutralDict3, neutralDict4,
  miloDict, leonaDict
]