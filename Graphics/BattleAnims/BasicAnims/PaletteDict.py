# Dictionary mapping palIDs to palette colours.

sharedDict = {
  "trans": b'\x55\x53',
  "white": b'\xFF\x7F',
  "outline": b'\xA5\x14'
}
ghostSharedDict = {
  "wep2_1": b'\x9F\x4A',
  "wep2_2": b'\x59\x21',
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
  "armour3_3": b'\x09\x2D',
}
humanSharedDict = {
  "wep2_1": b'\xF8\x6E',
  "wep2_2": b'\xED\x51',
  "wep3_1": b'\x7B\x77',
  "wep3_2": b'\xB6\x66',
  "wep3_3": b'\xED\x51',
  "wep4_1": b'\xFF\x7F',
  "wep4_2": b'\x7B\x77',
  "wep4_3": b'\xB6\x66',
  "wep4_4": b'\xED\x51',
}
enemySharedDict = {
  "armour3_1": b'\x3A\x18',
  "armour3_2": b'\x53\x14',
  "armour3_3": b'\x6B\x14',
  "armour4_1": b'\x9F\x42',
  "armour4_2": b'\x7B\x21',
  "armour4_3": b'\xB1\x14',
  "armour4_4": b'\x4A\x10'
}
neutralSharedDict = {
  "armour3_1": b'\x68\x27',
  "armour3_2": b'\x44\x16',
  "armour3_3": b'\x83\x11',
  "armour4_1": b'\xB5\x4F',
  "armour4_2": b'\xCB\x2E',
  "armour4_3": b'\xE7\x21',
  "armour4_4": b'\x25\x19'
}

humanDict1 = {
  "hair2_1": b'\x12\x46',
  "hair2_2": b'\x0B\x29',
  "hair3_1": b'\x12\x46',
  "hair3_2": b'\x4D\x31',
  "hair3_3": b'\xC9\x20',
  "skin2_1": b'\xFF\x6B',
  "skin2_2": b'\x1F\x4B',
  "skin3_1": b'\xFF\x6B',
  "skin3_2": b'\x1F\x4B',
  "skin3_3": b'\x2E\x19',
  "skin4_1": b'\xFF\x6B',
  "skin4_2": b'\x1F\x4B',
  "skin4_3": b'\x18\x2A',
  "skin4_4": b'\x2E\x19',
  "trim4_1": b'\xD7\x77',
  "trim4_2": b'\x32\x63',
  "trim4_3": b'\x6E\x4A',
  "trim4_4": b'\x48\x25',
  "underw3_1": b'\x96\x2A',
  "underw3_2": b'\x8E\x15',
  "underw3_3": b'\xA7\x08',
  "underw4_1": b'\x9C\x67',
  "underw4_2": b'\x18\x53',
  "underw4_3": b'\x52\x3A',
  "underw4_4": b'\x8C\x21'
}
humanDict1 = {**humanDict1, **sharedDict.copy()}
humanDict1 = {**humanDict1, **humanSharedDict.copy()}

humanDict2 = {
  "hair2_1": b'\x1F\x12',
  "hair2_2": b'\x36\x21',
  "hair3_1": b'\x5F\x22',
  "hair3_2": b'\x98\x1D',
  "hair3_3": b'\xF2\x18',
  "skin2_1": b'\x5D\x47',
  "skin2_2": b'\xBA\x42',
  "skin3_1": b'\x5D\x47',
  "skin3_2": b'\xBA\x42',
  "skin3_3": b'\xF2\x0C',
  "skin4_1": b'\x5D\x47',
  "skin4_2": b'\xBA\x42',
  "skin4_3": b'\x97\x21',
  "skin4_4": b'\xF2\x0C',
  "trim4_1": b'\xBE\x5F',
  "trim4_2": b'\x19\x4B',
  "trim4_3": b'\x53\x3A',
  "trim4_4": b'\x2A\x21',
  "underw3_1": b'\xCF\x4E',
  "underw3_2": b'\x4B\x42',
  "underw3_3": b'\x25\x1D',
  "underw4_1": b'\x99\x73',
  "underw4_2": b'\x14\x63',
  "underw4_3": b'\x4E\x4A',
  "underw4_4": b'\x88\x31'
}
humanDict2 = {**humanDict2, **sharedDict.copy()}
humanDict2 = {**humanDict2, **humanSharedDict.copy()}

humanDict3 = {
  "hair2_1": b'\xE9\x3A',
  "hair2_2": b'\x80\x19',
  "hair3_1": b'\x6D\x4B',
  "hair3_2": b'\x2A\x26',
  "hair3_3": b'\x47\x11',
  "skin2_1": b'\xDF\x3A',
  "skin2_2": b'\x18\x2A',
  "skin3_1": b'\xDF\x3A',
  "skin3_2": b'\x18\x2A',
  "skin3_3": b'\xCC\x08',
  "skin4_1": b'\xDF\x3A',
  "skin4_2": b'\x18\x2A',
  "skin4_3": b'\x2E\x19',
  "skin4_4": b'\x89\x04',
  "trim4_1": b'\x7B\x6F',
  "trim4_2": b'\x73\x4E',
  "trim4_3": b'\x8C\x31',
  "trim4_4": b'\xE7\x1C',
  "underw3_1": b'\xF4\x59',
  "underw3_2": b'\x4E\x41',
  "underw3_3": b'\xC7\x24',
  "underw4_1": b'\x3F\x67',
  "underw4_2": b'\x9B\x52',
  "underw4_3": b'\x95\x31',
  "underw4_4": b'\xEC\x1C'
}
humanDict3 = {**humanDict3, **sharedDict.copy()}
humanDict3 = {**humanDict3, **humanSharedDict.copy()}

humanDict4 = {
  "hair2_1": b'\xDC\x71',
  "hair2_2": b'\xAE\x58',
  "hair3_1": b'\x3F\x7E',
  "hair3_2": b'\xB7\x7C',
  "hair3_3": b'\xAE\x58',
  "skin2_1": b'\xF5\x31',
  "skin2_2": b'\x30\x15',
  "skin3_1": b'\xF5\x31',
  "skin3_2": b'\x93\x25',
  "skin3_3": b'\xCC\x08',
  "skin4_1": b'\xF6\x31',
  "skin4_2": b'\x72\x21',
  "skin4_3": b'\x0F\x11',
  "skin4_4": b'\x8A\x00',
  "trim4_1": b'\x5F\x6F',
  "trim4_2": b'\xBC\x5A',
  "trim4_3": b'\x36\x46',
  "trim4_4": b'\x30\x21',
  "underw3_1": b'\x39\x67',
  "underw3_2": b'\x94\x52',
  "underw3_3": b'\x6B\x2D',
  "underw4_1": b'\x9C\x73',
  "underw4_2": b'\x18\x63',
  "underw4_3": b'\x52\x4A',
  "underw4_4": b'\x8C\x31'
}
humanDict4 = {**humanDict4, **sharedDict.copy()}
humanDict4 = {**humanDict4, **humanSharedDict.copy()}

ghostDict1 = {
  "hair2_1": b'\xB9\x2F',
  "hair2_2": b'\x75\x12',
  "hair3_1": b'\xFB\x37',
  "hair3_2": b'\x17\x13',
  "hair3_3": b'\x11\x06',
  "skin2_1": b'\xD7\x77',
  "skin2_2": b'\xF0\x5A',
  "skin3_1": b'\xD7\x77',
  "skin3_2": b'\x32\x63',
  "skin3_3": b'\x6E\x4A',
  "skin4_1": b'\xD7\x77',
  "skin4_2": b'\x32\x63',
  "skin4_3": b'\x6E\x4A',
  "skin4_4": b'\x48\x25',
  "trim4_1": b'\xD7\x77',
  "trim4_2": b'\x32\x63',
  "trim4_3": b'\x6E\x4A',
  "trim4_4": b'\x48\x25',
  "underw3_1": b'\x56\x29',
  "underw3_2": b'\xAE\x14',
  "underw3_3": b'\x47\x08',
  "underw4_1": b'\x9C\x67',
  "underw4_2": b'\x18\x53',
  "underw4_3": b'\x52\x3A',
  "underw4_4": b'\x8C\x21',
  "highlight2_1": b'\x7B\x6F',
  "highlight2_2": b'\xEF\x3D',
  "highlight3_1": b'\xFF\x7F',
  "highlight3_2": b'\x94\x52',
  "highlight3_3": b'\xCE\x39'
}
ghostDict1 = {**ghostDict1, **sharedDict.copy()}
ghostDict1 = {**ghostDict1, **ghostSharedDict.copy()}

ghostDict2 = {
  "hair2_1": b'\x67\x77',
  "hair2_2": b'\xC0\x55',
  "hair3_1": b'\xA9\x7F',
  "hair3_2": b'\xE0\x7E',
  "hair3_3": b'\x80\x4D',
  "skin2_1": b'\xBE\x5F',
  "skin2_2": b'\xD7\x42',
  "skin3_1": b'\xBE\x5F',
  "skin3_2": b'\xD7\x42',
  "skin3_3": b'\x2A\x21',
  "skin4_1": b'\xBE\x5F',
  "skin4_2": b'\x19\x4B',
  "skin4_3": b'\x53\x3A',
  "skin4_4": b'\x2A\x21',
  "trim4_1": b'\xBE\x5F',
  "trim4_2": b'\x19\x4B',
  "trim4_3": b'\x53\x3A',
  "trim4_4": b'\x2A\x21',
  "underw3_1": b'\xCF\x4E',
  "underw3_2": b'\x4B\x42',
  "underw3_3": b'\x25\x1D',
  "underw4_1": b'\x99\x73',
  "underw4_2": b'\x14\x63',
  "underw4_3": b'\x4E\x4A',
  "underw4_4": b'\x88\x31',
  "highlight2_1": b'\x2B\x6F',
  "highlight2_2": b'\xC0\x55',
  "highlight3_1": b'\xEC\x7F',
  "highlight3_2": b'\xE0\x7E',
  "highlight3_3": b'\x80\x4D'
}
ghostDict2 = {**ghostDict2, **sharedDict.copy()}
ghostDict2 = {**ghostDict2, **ghostSharedDict.copy()}

ghostDict3 = {
  "hair2_1": b'\x3D\x72',
  "hair2_2": b'\xF5\x48',
  "hair3_1": b'\x7F\x7A',
  "hair3_2": b'\xBA\x65',
  "hair3_3": b'\xD4\x44',
  "skin2_1": b'\x7B\x6F',
  "skin2_2": b'\x73\x4E',
  "skin3_1": b'\x7B\x6F',
  "skin3_2": b'\xB5\x56',
  "skin3_3": b'\x29\x25',
  "skin4_1": b'\x7B\x6F',
  "skin4_2": b'\x73\x4E',
  "skin4_3": b'\x8C\x31',
  "skin4_4": b'\xE7\x1C',
  "trim4_1": b'\x7B\x6F',
  "trim4_2": b'\x73\x4E',
  "trim4_3": b'\x8C\x31',
  "trim4_4": b'\xE7\x1C',
  "underw3_1": b'\x96\x2A',
  "underw3_2": b'\x8E\x15',
  "underw3_3": b'\xA7\x08',
  "underw4_1": b'\x3F\x67',
  "underw4_2": b'\x9B\x52',
  "underw4_3": b'\x95\x31',
  "underw4_4": b'\xEC\x1C',
  "highlight2_1": b'\x7B\x1B',
  "highlight2_2": b'\x3A\x16',
  "highlight3_1": b'\xFF\x33',
  "highlight3_2": b'\x9E\x02',
  "highlight3_3": b'\x93\x01'
}
ghostDict3 = {**ghostDict3, **sharedDict.copy()}
ghostDict3 = {**ghostDict3, **ghostSharedDict.copy()}

ghostDict4 = {
  "hair2_1": b'\xB4\x63',
  "hair2_2": b'\x49\x42',
  "hair3_1": b'\xF6\x6B',
  "hair3_2": b'\x2E\x53',
  "hair3_3": b'\x49\x42',
  "skin2_1": b'\x5F\x6F',
  "skin2_2": b'\x59\x4E',
  "skin3_1": b'\x5F\x6F',
  "skin3_2": b'\x59\x4E',
  "skin3_3": b'\x30\x21',
  "skin4_1": b'\x5F\x6F',
  "skin4_2": b'\xBC\x5A',
  "skin4_3": b'\x36\x46',
  "skin4_4": b'\x30\x21',
  "trim4_1": b'\x5F\x6F',
  "trim4_2": b'\xBC\x5A',
  "trim4_3": b'\x36\x46',
  "trim4_4": b'\x30\x21',
  "underw3_1": b'\x6F\x4E',
  "underw3_2": b'\xA9\x35',
  "underw3_3": b'\x04\x21',
  "underw4_1": b'\x9C\x73',
  "underw4_2": b'\x18\x63',
  "underw4_3": b'\x52\x4A',
  "underw4_4": b'\x8C\x31',
  "highlight2_1": b'\x71\x47',
  "highlight2_2": b'\x49\x26',
  "highlight3_1": b'\xB3\x4F',
  "highlight3_2": b'\x0B\x2F',
  "highlight3_3": b'\x07\x1E'
}
ghostDict4 = {**ghostDict4, **sharedDict.copy()}
ghostDict4 = {**ghostDict4, **ghostSharedDict.copy()}

enemyDict1 = {
  "highlight2_1": b'\x7B\x1B',
  "highlight2_2": b'\x3A\x16',
  "highlight3_1": b'\xFF\x33',
  "highlight3_2": b'\x9E\x02',
  "highlight3_3": b'\x93\x01'
}
enemyDict1 = {**enemyDict1, **humanDict1.copy()}
enemyDict1 = {**enemyDict1, **enemySharedDict.copy()}

enemyDict2 = {
  "highlight2_1": b'\x2B\x6F',
  "highlight2_2": b'\xC0\x55',
  "highlight3_1": b'\xEC\x7F',
  "highlight3_2": b'\xE0\x7E',
  "highlight3_3": b'\x80\x4D'
}
enemyDict2 = {**enemyDict2, **humanDict2.copy()}
enemyDict2 = {**enemyDict2, **enemySharedDict.copy()}

enemyDict3 = {
  "highlight2_1": b'\x7B\x1B',
  "highlight2_2": b'\x3A\x16',
  "highlight3_1": b'\xFF\x33',
  "highlight3_2": b'\x9E\x02',
  "highlight3_3": b'\x93\x01'
}
enemyDict3 = {**enemyDict3, **humanDict3.copy()}
enemyDict3 = {**enemyDict3, **enemySharedDict.copy()}

enemyDict4 = {
  "highlight2_1": b'\x2B\x6F',
  "highlight2_2": b'\xC0\x55',
  "highlight3_1": b'\xEC\x7F',
  "highlight3_2": b'\xE0\x7E',
  "highlight3_3": b'\x80\x4D'
}
enemyDict4 = {**enemyDict4, **humanDict4.copy()}
enemyDict4 = {**enemyDict4, **enemySharedDict.copy()}

neutralDict1 = {
  "highlight2_1": b'\x5F\x29',
  "highlight2_2": b'\x55\x08',
  "highlight3_1": b'\x9F\x31',
  "highlight3_2": b'\x9A\x10',
  "highlight3_3": b'\x53\x08'
}
neutralDict1 = {**neutralDict1, **humanDict1.copy()}
neutralDict1 = {**neutralDict1, **neutralSharedDict.copy()}

neutralDict2 = {
  "highlight2_1": b'\x7B\x1B',
  "highlight2_2": b'\x3A\x16',
  "highlight3_1": b'\xFF\x33',
  "highlight3_2": b'\x9E\x02',
  "highlight3_3": b'\x93\x01'
}
neutralDict2 = {**neutralDict2, **humanDict2.copy()}
neutralDict2 = {**neutralDict2, **neutralSharedDict.copy()}

neutralDict3 = {
  "highlight2_1": b'\x5F\x29',
  "highlight2_2": b'\x55\x08',
  "highlight3_1": b'\x9F\x31',
  "highlight3_2": b'\x9A\x10',
  "highlight3_3": b'\x53\x08'
}
neutralDict3 = {**neutralDict3, **humanDict3.copy()}
neutralDict3 = {**neutralDict3, **neutralSharedDict.copy()}

neutralDict4 = {
  "highlight2_1": b'\x7B\x1B',
  "highlight2_2": b'\x3A\x16',
  "highlight3_1": b'\xFF\x33',
  "highlight3_2": b'\x9E\x02',
  "highlight3_3": b'\x93\x01'
}
neutralDict4 = {**neutralDict4, **humanDict4.copy()}
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
  "armour3_2": b'\x8C\x46',
  "armour3_3": b'\x86\x21',
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