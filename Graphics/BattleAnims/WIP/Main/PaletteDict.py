# Dictionary mapping palIDs to palette colours.

sharedDict = {
  "trans": b'\x5553',
  "white": b'\xFF7F',
  "outline": b'\xA514'
}
ghostSharedDict = {
  "wep2_1": b'\x5921',
  "wep2_2": b'\xD414',
  "wep3_1": b'\x9F4A',
  "wep3_2": b'\xFC31',
  "wep3_3": b'\x5921',
  "wep4_1": b'\x9F4A',
  "wep4_2": b'\xFC31',
  "wep4_3": b'\x5921',
  "wep4_4": b'\xD414',
  "armour4_1": b'\x7762',
  "armour4_2": b'\xB149',
  "armour4_3": b'\x4D35',
  "armour4_4": b'\x092D',
  "armour3_1": b'\xB149',
  "armour3_2": b'\x4D35',
  "armour3_3": b'\x092D'
}
humanSharedDict = {
  "wep2_1": b'\xF86E',
  "wep2_2": b'\xED51',
  "wep3_1": b'\x7B77',
  "wep3_2": b'\xF86E',
  "wep3_3": b'\xED51',
  "wep4_1": b'\xFF7F',
  "wep4_2": b'\x7B77',
  "wep4_3": b'\xF86E',
  "wep4_4": b'\xED51',
  "underw3_1": b'\xF34D',
  "underw3_2": b'\x6F3D',
  "underw3_3": b'\x0C31'
}
enemySharedDict = {
  "armour4_1": b'\x9F42',
  "armour4_2": b'\x7B21',
  "armour4_3": b'\xB114',
  "armour4_4": b'\x4A10',
  "armour3_1": b'\x3A18',
  "armour3_2": b'\x5314',
  "armour3_3": b'\x6B14'
}
neutralSharedDict = {
  "armour4_1": b'\xB54F',
  "armour4_2": b'\xCB2E',
  "armour4_3": b'\xE721',
  "armour4_4": b'\x2519',
  "armour3_1": b'\x6827',
  "armour3_2": b'\xA722',
  "armour3_3": b'\x0722'
}

ghostDict1 = {
  "skin4_1": b'\xD777',
  "skin4_2": b'\x3263',
  "skin4_3": b'\x6E4A',
  "skin4_4": b'\x4825',
  "underw3_1": b'\x962A',
  "underw3_2": b'\x8E15',
  "underw3_3": b'\xA708'
}
ghostDict1 = {**ghostDict1, **sharedDict.copy()}
ghostDict1 = {**ghostDict1, **ghostSharedDict.copy()}

ghostDict2 = {
  "skin4_1": b'\xBE5F',
  "skin4_2": b'\x194B',
  "skin4_3": b'\x533A',
  "skin4_4": b'\x2A21',
  "underw3_1": b'\xCF4E',
  "underw3_2": b'\x4B42',
  "underw3_3": b'\x251D'
}
ghostDict2 = {**ghostDict2, **sharedDict.copy()}
ghostDict2 = {**ghostDict2, **ghostSharedDict.copy()}

ghostDict3 = {
  "skin4_1": b'\x7B6F',
  "skin4_2": b'\x734E',
  "skin4_3": b'\x8C31',
  "skin4_4": b'\xE71C',
  "underw3_1": b'\x3933',
  "underw3_2": b'\x731E',
  "underw3_3": b'\xAD0D'
}
ghostDict3 = {**ghostDict3, **sharedDict.copy()}
ghostDict3 = {**ghostDict3, **ghostSharedDict.copy()}

ghostDict4 = {
  "skin4_1": b'\x5F6F',
  "skin4_2": b'\xBC5A',
  "skin4_3": b'\x3646',
  "skin4_4": b'\x3021',
  "underw3_1": b'\x6F4E',
  "underw3_2": b'\xEB3D',
  "underw3_3": b'\x8831'
}
ghostDict4 = {**ghostDict4, **sharedDict.copy()}
ghostDict4 = {**ghostDict4, **ghostSharedDict.copy()}

enemyDict1 = {
  "skin4_1": b'\xFF6B',
  "skin4_2": b'\x1F4B',
  "skin4_3": b'\x182A',
  "skin4_4": b'\x2E19'
}
enemyDict1 = {**enemyDict1, **sharedDict.copy()}
enemyDict1 = {**enemyDict1, **humanSharedDict.copy()}
enemyDict1 = {**enemyDict1, **enemySharedDict.copy()}

enemyDict2 = {
  "skin4_1": b'\x5D47',
  "skin4_2": b'\xBA42',
  "skin4_3": b'\x9721',
  "skin4_4": b'\xF20C'
}
enemyDict2 = {**enemyDict2, **sharedDict.copy()}
enemyDict2 = {**enemyDict2, **humanSharedDict.copy()}
enemyDict2 = {**enemyDict2, **enemySharedDict.copy()}

enemyDict3 = {
  "skin4_1": b'\xDF3A',
  "skin4_2": b'\x182A',
  "skin4_3": b'\x2E19',
  "skin4_4": b'\x8904'
}
enemyDict3 = {**enemyDict3, **sharedDict.copy()}
enemyDict3 = {**enemyDict3, **humanSharedDict.copy()}
enemyDict3 = {**enemyDict3, **enemySharedDict.copy()}

enemyDict4 = {
  "skin4_1": b'\xF531',
  "skin4_2": b'\x9325',
  "skin4_3": b'\x3015',
  "skin4_4": b'\xCC08'
}
enemyDict4 = {**enemyDict4, **sharedDict.copy()}
enemyDict4 = {**enemyDict4, **humanSharedDict.copy()}
enemyDict4 = {**enemyDict4, **enemySharedDict.copy()}

neutralDict1 = {
  "skin4_1": b'\xFF6B',
  "skin4_2": b'\x1F4B',
  "skin4_3": b'\x182A',
  "skin4_4": b'\x2E19'
}
neutralDict1 = {**neutralDict1, **sharedDict.copy()}
neutralDict1 = {**neutralDict1, **humanSharedDict.copy()}
neutralDict1 = {**neutralDict1, **neutralSharedDict.copy()}

neutralDict2 = {
  "skin4_1": b'\x5D47',
  "skin4_2": b'\xBA42',
  "skin4_3": b'\x9721',
  "skin4_4": b'\xF20C'
}
neutralDict2 = {**neutralDict2, **sharedDict.copy()}
neutralDict2 = {**neutralDict2, **humanSharedDict.copy()}
neutralDict2 = {**neutralDict2, **neutralSharedDict.copy()}

neutralDict3 = {
  "skin4_1": b'\xDF3A',
  "skin4_2": b'\x182A',
  "skin4_3": b'\x2E19',
  "skin4_4": b'\x8904'
}
neutralDict3 = {**neutralDict3, **sharedDict.copy()}
neutralDict3 = {**neutralDict3, **humanSharedDict.copy()}
neutralDict3 = {**neutralDict3, **neutralSharedDict.copy()}

neutralDict4 = {
  "skin4_1": b'\xF531',
  "skin4_2": b'\x9325',
  "skin4_3": b'\x3015',
  "skin4_4": b'\xCC08'
}
neutralDict4 = {**neutralDict4, **sharedDict.copy()}
neutralDict4 = {**neutralDict4, **humanSharedDict.copy()}
neutralDict4 = {**neutralDict4, **neutralSharedDict.copy()}


dict = [
  ghostDict1, ghostDict2, ghostDict3, ghostDict4,
  enemyDict1, enemyDict2, enemyDict3, enemyDict4,
  neutralDict1, neutralDict2, neutralDict3, neutralDict4,
]