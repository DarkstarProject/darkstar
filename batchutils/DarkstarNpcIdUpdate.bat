@echo off

if "%1"=="" goto usage
if "%2"=="" goto usage

REM java -cp "." DarkstarNpcIdUpdate %1\sql\npc_list.sql %2\mob-list-000.xml
java -cp "." DarkstarNpcIdUpdate "Phanauet Channel" "Laiteconce" %1\sql\npc_list.sql %2\mob-list-001.xml
java -cp "." DarkstarNpcIdUpdate "Carpenter's Landing" "Chuaie" %1\sql\npc_list.sql %2\mob-list-002.xml
java -cp "." DarkstarNpcIdUpdate "Manaclipper" "Gniyah_Mischatt" %1\sql\npc_list.sql %2\mob-list-003.xml
java -cp "." DarkstarNpcIdUpdate "Bibiki Bay" "Fheli_Lapatzuo" %1\sql\npc_list.sql %2\mob-list-004.xml
java -cp "." DarkstarNpcIdUpdate "Uleguerand Range" "Buffalostalker_Dodzbraz" %1\sql\npc_list.sql %2\mob-list-005.xml
java -cp "." DarkstarNpcIdUpdate "Bearclaw Pinnacle" "Prishe" %1\sql\npc_list.sql %2\mob-list-006.xml
java -cp "." DarkstarNpcIdUpdate "Attohwa Chasm" "Cradle_of_Rebirth" %1\sql\npc_list.sql %2\mob-list-007.xml
java -cp "." DarkstarNpcIdUpdate "Boneyard Gully" "Prishe" %1\sql\npc_list.sql %2\mob-list-008.xml
java -cp "." DarkstarNpcIdUpdate "Pso'Xja" "Prishe" %1\sql\npc_list.sql %2\mob-list-009.xml
java -cp "." DarkstarNpcIdUpdate "The Shrouded Maw" "Prishe" %1\sql\npc_list.sql %2\mob-list-010.xml
java -cp "." DarkstarNpcIdUpdate "Oldton Movalpolos" "Tarnotik" %1\sql\npc_list.sql %2\mob-list-011.xml
java -cp "." DarkstarNpcIdUpdate "Newton Movalpolos" "Sleakachiq" %1\sql\npc_list.sql %2\mob-list-012.xml
java -cp "." DarkstarNpcIdUpdate "Mine Shaft #2716" "Louverance" %1\sql\npc_list.sql %2\mob-list-013.xml
java -cp "." DarkstarNpcIdUpdate "Hall of Transference" "Wolfgang" %1\sql\npc_list.sql %2\mob-list-014.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Konschtat" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-015.xml
java -cp "." DarkstarNpcIdUpdate "Promyvion - Holla" "Rendezvous_Point" %1\sql\npc_list.sql %2\mob-list-016.xml
java -cp "." DarkstarNpcIdUpdate "Spire of Holla" "Radiant_Aureole" %1\sql\npc_list.sql %2\mob-list-017.xml
java -cp "." DarkstarNpcIdUpdate "Promyvion - Dem" "Rendezvous_Point" %1\sql\npc_list.sql %2\mob-list-018.xml
java -cp "." DarkstarNpcIdUpdate "Spire of Dem" "Radiant_Aureole" %1\sql\npc_list.sql %2\mob-list-019.xml
java -cp "." DarkstarNpcIdUpdate "Promyvion - Mea" "Rendezvous_Point" %1\sql\npc_list.sql %2\mob-list-020.xml
java -cp "." DarkstarNpcIdUpdate "Spire of Mea" "Radiant_Aureole" %1\sql\npc_list.sql %2\mob-list-021.xml
java -cp "." DarkstarNpcIdUpdate "Promyvion - Vahzl" "Tenzen" %1\sql\npc_list.sql %2\mob-list-022.xml
java -cp "." DarkstarNpcIdUpdate "Spire of Vahzl" "Radiant_Aureole" %1\sql\npc_list.sql %2\mob-list-023.xml
java -cp "." DarkstarNpcIdUpdate "Lufaise Meadows" "Sanctia" %1\sql\npc_list.sql %2\mob-list-024.xml
java -cp "." DarkstarNpcIdUpdate "Misareaux Coast" "Spatial_Displacement" %1\sql\npc_list.sql %2\mob-list-025.xml
java -cp "." DarkstarNpcIdUpdate "Tavnazian Safehold" "Latteaune" %1\sql\npc_list.sql %2\mob-list-026.xml
java -cp "." DarkstarNpcIdUpdate "Phomiuna Aqueducts" "BOX" %1\sql\npc_list.sql %2\mob-list-027.xml
java -cp "." DarkstarNpcIdUpdate "Sacrarium" "WALLMASTER" %1\sql\npc_list.sql %2\mob-list-028.xml
java -cp "." DarkstarNpcIdUpdate "Riverne - Site #B01" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-029.xml
java -cp "." DarkstarNpcIdUpdate "Riverne - Site #A01" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-030.xml
java -cp "." DarkstarNpcIdUpdate "Monarch Linn" "Prishe" %1\sql\npc_list.sql %2\mob-list-031.xml
java -cp "." DarkstarNpcIdUpdate "Sealion's Den" "Louverance" %1\sql\npc_list.sql %2\mob-list-032.xml
java -cp "." DarkstarNpcIdUpdate "Al'Taieu" "Promathia" %1\sql\npc_list.sql %2\mob-list-033.xml
java -cp "." DarkstarNpcIdUpdate "Grand Palace of Hu'Xzoi" "Louverance" %1\sql\npc_list.sql %2\mob-list-034.xml
java -cp "." DarkstarNpcIdUpdate "The Garden of Ru'Hmet" "Warp_1F" %1\sql\npc_list.sql %2\mob-list-035.xml
java -cp "." DarkstarNpcIdUpdate "Empyreal Paradox" "WARP" %1\sql\npc_list.sql %2\mob-list-036.xml
java -cp "." DarkstarNpcIdUpdate "Temenos" "Scanning Device" %1\sql\npc_list.sql %2\mob-list-037.xml
REM java -cp "." DarkstarNpcIdUpdate "Apollyon" "<TBD>" %1\sql\npc_list.sql %2\mob-list-038.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Valkurm" "<TBD>" %1\sql\npc_list.sql %2\mob-list-039.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Buburimu" "<TBD"> %1\sql\npc_list.sql %2\mob-list-040.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Qufim" "<TBD>" %1\sql\npc_list.sql %2\mob-list-041.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Tavnazia" "<TBD>" %1\sql\npc_list.sql %2\mob-list-042.xml
REM java -cp "." DarkstarNpcIdUpdate "Diorama Abdhaljs-Ghelsba" "<TBD>" %1\sql\npc_list.sql %2\mob-list-043.xml
java -cp "." DarkstarNpcIdUpdate "Abdhaljs Isle-Purgonorgo" "Herald" %1\sql\npc_list.sql %2\mob-list-044.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Tahrongi" "Manananggal" %1\sql\npc_list.sql %2\mob-list-045.xml
java -cp "." DarkstarNpcIdUpdate "Open Sea Route to Al Zahbi" "Adeben" %1\sql\npc_list.sql %2\mob-list-046.xml
java -cp "." DarkstarNpcIdUpdate "Open Sea Route to Mhaura" "Sheadon" %1\sql\npc_list.sql %2\mob-list-047.xml
java -cp "." DarkstarNpcIdUpdate "Al Zahbi" "Shield_master" %1\sql\npc_list.sql %2\mob-list-048.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-049.xml
java -cp "." DarkstarNpcIdUpdate "Aht Urhgan Whitegate" "Tazhaal" %1\sql\npc_list.sql %2\mob-list-050.xml
java -cp "." DarkstarNpcIdUpdate "Wajaom Woodlands" "Peculiar_Bud" %1\sql\npc_list.sql %2\mob-list-051.xml
java -cp "." DarkstarNpcIdUpdate "Bhaflau Thickets" "Mamuuja" %1\sql\npc_list.sql %2\mob-list-052.xml
java -cp "." DarkstarNpcIdUpdate "Nashmau" "Abihaal" %1\sql\npc_list.sql %2\mob-list-053.xml
java -cp "." DarkstarNpcIdUpdate "Arrapago Reef" "Irurusi" %1\sql\npc_list.sql %2\mob-list-054.xml
java -cp "." DarkstarNpcIdUpdate "Ilrusi Atoll" "Ancient_Lockbox" %1\sql\npc_list.sql %2\mob-list-055.xml
java -cp "." DarkstarNpcIdUpdate "Periqia" "Ancient Lockbox" %1\sql\npc_list.sql %2\mob-list-056.xml
java -cp "." DarkstarNpcIdUpdate "Talacca Cove" "Wasuhd" %1\sql\npc_list.sql %2\mob-list-057.xml
java -cp "." DarkstarNpcIdUpdate "Silver Sea Route to Nashmau" "Qudamahf" %1\sql\npc_list.sql %2\mob-list-058.xml
java -cp "." DarkstarNpcIdUpdate "Silver Sea Route to Al Zahbi" "Shadeeu" %1\sql\npc_list.sql %2\mob-list-059.xml
REM java -cp "." DarkstarNpcIdUpdate "The Ashu Talif" "<TBD>" %1\sql\npc_list.sql %2\mob-list-060.xml
java -cp "." DarkstarNpcIdUpdate "Mount Zhayolm" "Reberosu" %1\sql\npc_list.sql %2\mob-list-061.xml
java -cp "." DarkstarNpcIdUpdate "Halvung" "Light_Point" %1\sql\npc_list.sql %2\mob-list-062.xml
REM java -cp "." DarkstarNpcIdUpdate "Lebros Cavern" "<TBD>" %1\sql\npc_list.sql %2\mob-list-063.xml
java -cp "." DarkstarNpcIdUpdate "Navukgo Execution Chamber" "Ramblix" %1\sql\npc_list.sql %2\mob-list-064.xml
java -cp "." DarkstarNpcIdUpdate "Mamook" "Astral_Plinth" %1\sql\npc_list.sql %2\mob-list-065.xml
REM java -cp "." DarkstarNpcIdUpdate "Mamool Ja Training Grounds" "<TBD>" %1\sql\npc_list.sql %2\mob-list-066.xml
REM java -cp "." DarkstarNpcIdUpdate "Jade Sepulcher" "<TBD>" %1\sql\npc_list.sql %2\mob-list-067.xml
java -cp "." DarkstarNpcIdUpdate "Aydeewa Subterrane" "Dampsoil" %1\sql\npc_list.sql %2\mob-list-068.xml
REM java -cp "." DarkstarNpcIdUpdate "Leujaom Sanctum" "<TBD>" %1\sql\npc_list.sql %2\mob-list-069.xml
java -cp "." DarkstarNpcIdUpdate "Chocobo Circuit" "Claiborne" %1\sql\npc_list.sql %2\mob-list-070.xml
REM java -cp "." DarkstarNpcIdUpdate "The Colosseum" "<TBD>" %1\sql\npc_list.sql %2\mob-list-071.xml
java -cp "." DarkstarNpcIdUpdate "Alzadaal Undersea Ruins" "Yasfel" %1\sql\npc_list.sql %2\mob-list-072.xml
REM java -cp "." DarkstarNpcIdUpdate "Zhayolm Remnants" "<TBD>" %1\sql\npc_list.sql %2\mob-list-073.xml
REM java -cp "." DarkstarNpcIdUpdate "Arrapago Remnants" "<TBD>" %1\sql\npc_list.sql %2\mob-list-074.xml
REM java -cp "." DarkstarNpcIdUpdate "Bhaflau Remnants" "<TBD>" %1\sql\npc_list.sql %2\mob-list-075.xml
REM java -cp "." DarkstarNpcIdUpdate "Silver Sea Remnants" "<TBD>" %1\sql\npc_list.sql %2\mob-list-076.xml
java -cp "." DarkstarNpcIdUpdate "Nyzul Isle" "GOAL" %1\sql\npc_list.sql %2\mob-list-077.xml
java -cp "." DarkstarNpcIdUpdate "Hazhalm Testing Grounds" "Ramblix" %1\sql\npc_list.sql %2\mob-list-078.xml
java -cp "." DarkstarNpcIdUpdate "Caedarva Mire" "Zikko" %1\sql\npc_list.sql %2\mob-list-079.xml
java -cp "." DarkstarNpcIdUpdate "Southern San d'Oria [S]" "Lurouillat" %1\sql\npc_list.sql %2\mob-list-080.xml
java -cp "." DarkstarNpcIdUpdate "East Ronfaure [S]" "Cavernous_Maw" %1\sql\npc_list.sql %2\mob-list-081.xml
java -cp "." DarkstarNpcIdUpdate "Jugner Forest [S]" "Leonoyne" %1\sql\npc_list.sql %2\mob-list-082.xml
java -cp "." DarkstarNpcIdUpdate "Vunkerl Inlet [S]" "Time_Bomb" %1\sql\npc_list.sql %2\mob-list-083.xml
java -cp "." DarkstarNpcIdUpdate "Batallia Downs [S]" "Eberhard" %1\sql\npc_list.sql %2\mob-list-084.xml
java -cp "." DarkstarNpcIdUpdate "La Vaule [S]" "Ramblix" %1\sql\npc_list.sql %2\mob-list-085.xml
REM java -cp "." DarkstarNpcIdUpdate "Everbloom Hollow" "<TBD>" %1\sql\npc_list.sql %2\mob-list-086.xml
java -cp "." DarkstarNpcIdUpdate "Bastok Markets [S]" "Werei" %1\sql\npc_list.sql %2\mob-list-087.xml
java -cp "." DarkstarNpcIdUpdate "North Gustaberg [S]" "Cavernous_Maw" %1\sql\npc_list.sql %2\mob-list-088.xml
java -cp "." DarkstarNpcIdUpdate "Grauberg [S]" "Fay_Spring" %1\sql\npc_list.sql %2\mob-list-089.xml
java -cp "." DarkstarNpcIdUpdate "Pashhow Marshlands [S]" "Time_Bomb" %1\sql\npc_list.sql %2\mob-list-090.xml
java -cp "." DarkstarNpcIdUpdate "Rolanberry Fields [S]" "Cavernous_Maw" %1\sql\npc_list.sql %2\mob-list-091.xml
java -cp "." DarkstarNpcIdUpdate "Beadeaux [S]" "Infomation" %1\sql\npc_list.sql %2\mob-list-092.xml
REM java -cp "." DarkstarNpcIdUpdate "Ruhotz Silvermines" "<TBD>" %1\sql\npc_list.sql %2\mob-list-093.xml
java -cp "." DarkstarNpcIdUpdate "Windurst Waters [S]" "Infomation" %1\sql\npc_list.sql %2\mob-list-094.xml
java -cp "." DarkstarNpcIdUpdate "West Sarutabaruta [S]" "Time_Bomb" %1\sql\npc_list.sql %2\mob-list-095.xml
java -cp "." DarkstarNpcIdUpdate "Fort Karugo-Narugo [S]" "Time_Bomb" %1\sql\npc_list.sql %2\mob-list-096.xml
java -cp "." DarkstarNpcIdUpdate "Meriphataud Mountains [S]" "Time_Bomb" %1\sql\npc_list.sql %2\mob-list-097.xml
java -cp "." DarkstarNpcIdUpdate "Sauromugue Champaign [S]" "Time_Bomb" %1\sql\npc_list.sql %2\mob-list-098.xml
java -cp "." DarkstarNpcIdUpdate "Castle Oztroja [S]" "Infomation" %1\sql\npc_list.sql %2\mob-list-099.xml
java -cp "." DarkstarNpcIdUpdate "West Ronfaure" "Aaveleon" %1\sql\npc_list.sql %2\mob-list-100.xml
java -cp "." DarkstarNpcIdUpdate "East Ronfaure" "Andelain" %1\sql\npc_list.sql %2\mob-list-101.xml
java -cp "." DarkstarNpcIdUpdate "La Theine Plateau" "Equesobillot" %1\sql\npc_list.sql %2\mob-list-102.xml
java -cp "." DarkstarNpcIdUpdate "Valkurm Dunes" "Barnacled_Box" %1\sql\npc_list.sql %2\mob-list-103.xml
java -cp "." DarkstarNpcIdUpdate "Jugner Forest" "Crystwater_Spring" %1\sql\npc_list.sql %2\mob-list-104.xml
java -cp "." DarkstarNpcIdUpdate "Batallia Downs" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-105.xml
java -cp "." DarkstarNpcIdUpdate "North Gustaberg" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-106.xml
java -cp "." DarkstarNpcIdUpdate "South Gustaberg" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-107.xml
java -cp "." DarkstarNpcIdUpdate "Konschtat Highlands" "Shattered_Telepoint" %1\sql\npc_list.sql %2\mob-list-108.xml
java -cp "." DarkstarNpcIdUpdate "Pashhow Marshlands" "Naji" %1\sql\npc_list.sql %2\mob-list-109.xml
java -cp "." DarkstarNpcIdUpdate "Rolanberry Fields" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-110.xml
java -cp "." DarkstarNpcIdUpdate "Beaucedine Glacier" "Dariah" %1\sql\npc_list.sql %2\mob-list-111.xml
java -cp "." DarkstarNpcIdUpdate "Xarcabard" "Pelogrant" %1\sql\npc_list.sql %2\mob-list-112.xml
java -cp "." DarkstarNpcIdUpdate "Cape Teriggan" "Carbuncle" %1\sql\npc_list.sql %2\mob-list-113.xml
java -cp "." DarkstarNpcIdUpdate "Eastern Altepa Desert" "Carbuncle" %1\sql\npc_list.sql %2\mob-list-114.xml
java -cp "." DarkstarNpcIdUpdate "West Sarutabaruta" "Ipupu" %1\sql\npc_list.sql %2\mob-list-115.xml
java -cp "." DarkstarNpcIdUpdate "East Sarutabaruta" "Quh_Berhuja" %1\sql\npc_list.sql %2\mob-list-116.xml
java -cp "." DarkstarNpcIdUpdate "Tahrongi Canyon" "Tahrongi_Cacti" %1\sql\npc_list.sql %2\mob-list-117.xml
java -cp "." DarkstarNpcIdUpdate "Buburimu Peninsula" "Song_Runes" %1\sql\npc_list.sql %2\mob-list-118.xml
java -cp "." DarkstarNpcIdUpdate "Meriphataud Mountains" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-119.xml
java -cp "." DarkstarNpcIdUpdate "Sauromugue Champaign" "Stone_Monument" %1\sql\npc_list.sql %2\mob-list-120.xml
java -cp "." DarkstarNpcIdUpdate "The Sanctuary of Zi'Tah" "Carbuncle" %1\sql\npc_list.sql %2\mob-list-121.xml
java -cp "." DarkstarNpcIdUpdate "Ro'Maeve" "Talking_Doll" %1\sql\npc_list.sql %2\mob-list-122.xml
java -cp "." DarkstarNpcIdUpdate "Yuhtunga Jungle" "Carbuncle" %1\sql\npc_list.sql %2\mob-list-123.xml
java -cp "." DarkstarNpcIdUpdate "Yhoator Jungle" "Carbuncle" %1\sql\npc_list.sql %2\mob-list-124.xml
java -cp "." DarkstarNpcIdUpdate "Western Altepa Desert" "Carbuncle" %1\sql\npc_list.sql %2\mob-list-125.xml
java -cp "." DarkstarNpcIdUpdate "Qufim Island" "Nightflowers" %1\sql\npc_list.sql %2\mob-list-126.xml
java -cp "." DarkstarNpcIdUpdate "Behemoth's Dominion" "Cermet_Headstone" %1\sql\npc_list.sql %2\mob-list-127.xml
java -cp "." DarkstarNpcIdUpdate "Valley of Sorrows" "Capacucu" %1\sql\npc_list.sql %2\mob-list-128.xml
java -cp "." DarkstarNpcIdUpdate "Ghoyu's Reverie" "Antje" %1\sql\npc_list.sql %2\mob-list-129.xml
java -cp "." DarkstarNpcIdUpdate "Ru'Aun Gardens" "Zeid" %1\sql\npc_list.sql %2\mob-list-130.xml
REM java -cp "." DarkstarNpcIdUpdate "Mordion Gaol" "<TBD>" %1\sql\npc_list.sql %2\mob-list-131.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - La Theine" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-132.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-133.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Beaucedine" "<TBD>" %1\sql\npc_list.sql %2\mob-list-134.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Xarcabard" "<TBD>" %1\sql\npc_list.sql %2\mob-list-135.xml
java -cp "." DarkstarNpcIdUpdate "Beaucedine Glacier [S]" "Kaiser_Behemoth" %1\sql\npc_list.sql %2\mob-list-136.xml
java -cp "." DarkstarNpcIdUpdate "Xarcabard [S]" "Infomation" %1\sql\npc_list.sql %2\mob-list-137.xml
java -cp "." DarkstarNpcIdUpdate "Castle Zvahl Baileys [S]" "Ramblix" %1\sql\npc_list.sql %2\mob-list-138.xml
java -cp "." DarkstarNpcIdUpdate "Horlais Peak" "Lion" %1\sql\npc_list.sql %2\mob-list-139.xml
java -cp "." DarkstarNpcIdUpdate "Ghelsba Outpost" "Hut_Door" %1\sql\npc_list.sql %2\mob-list-140.xml
REM java -cp "." DarkstarNpcIdUpdate "Fort Ghelsba" <TBD> %1\sql\npc_list.sql %2\mob-list-141.xml
java -cp "." DarkstarNpcIdUpdate "Yughott Grotto" "Rahal" %1\sql\npc_list.sql %2\mob-list-142.xml
java -cp "." DarkstarNpcIdUpdate "Palborough Mines" "Old_Toolbox" %1\sql\npc_list.sql %2\mob-list-143.xml
java -cp "." DarkstarNpcIdUpdate "Waughroon Shrine" "Lion" %1\sql\npc_list.sql %2\mob-list-144.xml
java -cp "." DarkstarNpcIdUpdate "Giddeus" "Laa_Mozi" %1\sql\npc_list.sql %2\mob-list-145.xml
java -cp "." DarkstarNpcIdUpdate "Balga's Dais" "Lion" %1\sql\npc_list.sql %2\mob-list-146.xml
java -cp "." DarkstarNpcIdUpdate "Beadeaux" "Naji" %1\sql\npc_list.sql %2\mob-list-147.xml
java -cp "." DarkstarNpcIdUpdate "Qulun Dome" "Magicite" %1\sql\npc_list.sql %2\mob-list-148.xml
java -cp "." DarkstarNpcIdUpdate "Davoi" "Quemaricond" %1\sql\npc_list.sql %2\mob-list-149.xml
java -cp "." DarkstarNpcIdUpdate "Monastic Cavern" "Magicite" %1\sql\npc_list.sql %2\mob-list-150.xml
java -cp "." DarkstarNpcIdUpdate "Castle Oztroja" "Tebhi" %1\sql\npc_list.sql %2\mob-list-151.xml
java -cp "." DarkstarNpcIdUpdate "Altar Room" "Fickblix" %1\sql\npc_list.sql %2\mob-list-152.xml
java -cp "." DarkstarNpcIdUpdate "The Boyahda Tree" "Zonpa-Zippa" %1\sql\npc_list.sql %2\mob-list-153.xml
java -cp "." DarkstarNpcIdUpdate "Dragon's Aery" "Kilhwch" %1\sql\npc_list.sql %2\mob-list-154.xml
java -cp "." DarkstarNpcIdUpdate "Castle Zvahl Keep [S]" "Rikke" %1\sql\npc_list.sql %2\mob-list-155.xml
java -cp "." DarkstarNpcIdUpdate "Throne Room [S]" "Ramblix" %1\sql\npc_list.sql %2\mob-list-156.xml
java -cp "." DarkstarNpcIdUpdate "Middle Delkfutt's Tower" "Zeid" %1\sql\npc_list.sql %2\mob-list-157.xml
REM java -cp "." DarkstarNpcIdUpdate "Upper Delkfutt's Tower" "<TBD>" %1\sql\npc_list.sql %2\mob-list-158.xml
java -cp "." DarkstarNpcIdUpdate "Temple of Uggalepih" "Ancolain" %1\sql\npc_list.sql %2\mob-list-159.xml
java -cp "." DarkstarNpcIdUpdate "Den of Rancor" "Switch" %1\sql\npc_list.sql %2\mob-list-160.xml
java -cp "." DarkstarNpcIdUpdate "Castle Zvahl Baileys" "Switchstix" %1\sql\npc_list.sql %2\mob-list-161.xml
java -cp "." DarkstarNpcIdUpdate "Castle Zvahl Keep" "Talking_Doll" %1\sql\npc_list.sql %2\mob-list-162.xml
java -cp "." DarkstarNpcIdUpdate "Sacrificial Chamber" "Ramblix" %1\sql\npc_list.sql %2\mob-list-163.xml
java -cp "." DarkstarNpcIdUpdate "Garlaige Citadel [S]" "Ramblix" %1\sql\npc_list.sql %2\mob-list-164.xml
java -cp "." DarkstarNpcIdUpdate "Throne Room" "Lion" %1\sql\npc_list.sql %2\mob-list-165.xml
java -cp "." DarkstarNpcIdUpdate "Ranguemont Pass" "Myffore" %1\sql\npc_list.sql %2\mob-list-166.xml
java -cp "." DarkstarNpcIdUpdate "Bostaunieux Oubliette" "Novalmauge" %1\sql\npc_list.sql %2\mob-list-167.xml
java -cp "." DarkstarNpcIdUpdate "Chamber of Oracles" "Zeid" %1\sql\npc_list.sql %2\mob-list-168.xml
java -cp "." DarkstarNpcIdUpdate "Toraimarai Canal" "Karaha-Baruha" %1\sql\npc_list.sql %2\mob-list-169.xml
java -cp "." DarkstarNpcIdUpdate "Full Moon Fountain" "Foo_Beibo" %1\sql\npc_list.sql %2\mob-list-170.xml
java -cp "." DarkstarNpcIdUpdate "Crawler's Nest [S]" "Ramblix" %1\sql\npc_list.sql %2\mob-list-171.xml
java -cp "." DarkstarNpcIdUpdate "Zeruhn Mines" "Lasthenes" %1\sql\npc_list.sql %2\mob-list-172.xml
java -cp "." DarkstarNpcIdUpdate "Korroloka Tunnel" "Ramblix" %1\sql\npc_list.sql %2\mob-list-173.xml
java -cp "." DarkstarNpcIdUpdate "Kuftal Tunnel" "Werei" %1\sql\npc_list.sql %2\mob-list-174.xml
java -cp "." DarkstarNpcIdUpdate "The Eldieme Necropolis [S]" "Layton" %1\sql\npc_list.sql %2\mob-list-175.xml
java -cp "." DarkstarNpcIdUpdate "Sea Serpent Grotto" "Hurr_the_Betrayer" %1\sql\npc_list.sql %2\mob-list-176.xml
REM java -cp "." DarkstarNpcIdUpdate "Ve'Lugannon Palace" "<TBD>" %1\sql\npc_list.sql %2\mob-list-177.xml
java -cp "." DarkstarNpcIdUpdate "The Shrine of Ru'Avitau" "Lion" %1\sql\npc_list.sql %2\mob-list-178.xml
java -cp "." DarkstarNpcIdUpdate "Stellar Fulcrum" "Lion" %1\sql\npc_list.sql %2\mob-list-179.xml
java -cp "." DarkstarNpcIdUpdate "La'Loff Amphitheater" "Ramblix" %1\sql\npc_list.sql %2\mob-list-180.xml
java -cp "." DarkstarNpcIdUpdate "The Celestial Nexus" "Zeid" %1\sql\npc_list.sql %2\mob-list-181.xml
java -cp "." DarkstarNpcIdUpdate "Walk of Echoes" "Cavernous_Maw" %1\sql\npc_list.sql %2\mob-list-182.xml
REM java -cp "." DarkstarNpcIdUpdate "Maquette Abdhaljs-Legion" "<TBD>" %1\sql\npc_list.sql %2\mob-list-183.xml
java -cp "." DarkstarNpcIdUpdate "Lower Delkfutt's Tower" "Jima" %1\sql\npc_list.sql %2\mob-list-184.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - San d'Oria" "<TBD>" %1\sql\npc_list.sql %2\mob-list-185.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Bastok" "<TBD>" %1\sql\npc_list.sql %2\mob-list-186.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Windurst" "<TBD>" %1\sql\npc_list.sql %2\mob-list-187.xml
REM java -cp "." DarkstarNpcIdUpdate "Dynamis - Jeuno" "<TBD>" %1\sql\npc_list.sql %2\mob-list-188.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-189.xml
java -cp "." DarkstarNpcIdUpdate "King Ranperre's Tomb" "Destin" %1\sql\npc_list.sql %2\mob-list-190.xml
java -cp "." DarkstarNpcIdUpdate "Dangruf Wadi" "Saltvix" %1\sql\npc_list.sql %2\mob-list-191.xml
java -cp "." DarkstarNpcIdUpdate "Inner Horutoto Ruins" "Ajido-Marujido" %1\sql\npc_list.sql %2\mob-list-192.xml
java -cp "." DarkstarNpcIdUpdate "Ordelle's Caves" "Ruillont" %1\sql\npc_list.sql %2\mob-list-193.xml
java -cp "." DarkstarNpcIdUpdate "Outer Horutoto Ruins" "Ajido-Marujido" %1\sql\npc_list.sql %2\mob-list-194.xml
java -cp "." DarkstarNpcIdUpdate "The Eldieme Necropolis" "Hume_Bones" %1\sql\npc_list.sql %2\mob-list-195.xml
java -cp "." DarkstarNpcIdUpdate "Gusgen Mines" "Clay" %1\sql\npc_list.sql %2\mob-list-196.xml
java -cp "." DarkstarNpcIdUpdate "Crawler's Nest" "Olavia" %1\sql\npc_list.sql %2\mob-list-197.xml
java -cp "." DarkstarNpcIdUpdate "Maze of Shakhrami" "Rockwell" %1\sql\npc_list.sql %2\mob-list-198.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-199.xml
java -cp "." DarkstarNpcIdUpdate "Garlaige Citadel" "Mashira" %1\sql\npc_list.sql %2\mob-list-200.xml
java -cp "." DarkstarNpcIdUpdate "Cloister of Gales" "Talking_Doll" %1\sql\npc_list.sql %2\mob-list-201.xml
java -cp "." DarkstarNpcIdUpdate "Cloister of Storms" "Talking_Doll" %1\sql\npc_list.sql %2\mob-list-202.xml
java -cp "." DarkstarNpcIdUpdate "Cloister of Frost" "Ramblix" %1\sql\npc_list.sql %2\mob-list-203.xml
java -cp "." DarkstarNpcIdUpdate "Fei'Yin" "Lion" %1\sql\npc_list.sql %2\mob-list-204.xml
java -cp "." DarkstarNpcIdUpdate "Ifrit's Cauldron" "Altar_of_Ashes" %1\sql\npc_list.sql %2\mob-list-205.xml
java -cp "." DarkstarNpcIdUpdate "Qu'Bia Arena" "Zeid" %1\sql\npc_list.sql %2\mob-list-206.xml
java -cp "." DarkstarNpcIdUpdate "Cloister of Flames" "Ramblix" %1\sql\npc_list.sql %2\mob-list-207.xml
java -cp "." DarkstarNpcIdUpdate "Quicksand Caves" "Zeid" %1\sql\npc_list.sql %2\mob-list-208.xml
java -cp "." DarkstarNpcIdUpdate "Cloister of Tremors" "Talking_Doll" %1\sql\npc_list.sql %2\mob-list-209.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-210.xml
java -cp "." DarkstarNpcIdUpdate "Cloister of Tides" "Ramblix" %1\sql\npc_list.sql %2\mob-list-211.xml
java -cp "." DarkstarNpcIdUpdate "Gustav Tunnel" "Ramblix" %1\sql\npc_list.sql %2\mob-list-212.xml
REM java -cp "." DarkstarNpcIdUpdate "Labyrinth of Onzozo" "<TBD>" %1\sql\npc_list.sql %2\mob-list-213.xml
REM java -cp "." DarkstarNpcIdUpdate "Residential Area" "<TBD>" %1\sql\npc_list.sql %2\mob-list-214.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Attohwa" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-215.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Misareaux" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-216.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Vunkerl" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-217.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Altepa" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-218.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-219.xml
java -cp "." DarkstarNpcIdUpdate "Ship Bound for Selbina (Zone 220)" "Bhagirath" %1\sql\npc_list.sql %2\mob-list-220.xml
java -cp "." DarkstarNpcIdUpdate "Ship Bound for Mhaura (Zone 221)" "Sahn" %1\sql\npc_list.sql %2\mob-list-221.xml
java -cp "." DarkstarNpcIdUpdate "Provenance" "Grumblix" %1\sql\npc_list.sql %2\mob-list-222.xml
java -cp "." DarkstarNpcIdUpdate "San d'Oria - Jeuno Airship" "Nigel" %1\sql\npc_list.sql %2\mob-list-223.xml
java -cp "." DarkstarNpcIdUpdate "Bastok - Jeuno Airship" "Dereck" %1\sql\npc_list.sql %2\mob-list-224.xml
REM java -cp "." DarkstarNpcIdUpdate "Windurst - Jeuno Airship" "<TBD>" %1\sql\npc_list.sql %2\mob-list-225.xml
REM java -cp "." DarkstarNpcIdUpdate "Kazham - Jeuno Airship" "<TBD>" %1\sql\npc_list.sql %2\mob-list-226.xml
java -cp "." DarkstarNpcIdUpdate "Ship Bound for Selbina (pirates)" "Bhagirath" %1\sql\npc_list.sql %2\mob-list-227.xml
java -cp "." DarkstarNpcIdUpdate "Ship Bound for Mhaura (pirates)" "Sahn" %1\sql\npc_list.sql %2\mob-list-228.xml
REM java -cp "." DarkstarNpcIdUpdate "<NO ZONE>" "<TBD>" %1\sql\npc_list.sql %2\mob-list-229.xml
java -cp "." DarkstarNpcIdUpdate "Southern San d'Oria" "Ceraule" %1\sql\npc_list.sql %2\mob-list-230.xml
java -cp "." DarkstarNpcIdUpdate "Northern San d'Oria" "Nonterene" %1\sql\npc_list.sql %2\mob-list-231.xml
java -cp "." DarkstarNpcIdUpdate "Port San d'Oria" "Trion" %1\sql\npc_list.sql %2\mob-list-232.xml
java -cp "." "Chateau d'Oraguille" "Pieuje" DarkstarNpcIdUpdate %1\sql\npc_list.sql %2\mob-list-233.xml
java -cp "." DarkstarNpcIdUpdate "Bastok Mines" "Hani" %1\sql\npc_list.sql %2\mob-list-234.xml
java -cp "." DarkstarNpcIdUpdate "Bastok Markets" "Horatius" %1\sql\npc_list.sql %2\mob-list-235.xml
java -cp "." DarkstarNpcIdUpdate "Port Bastok" "Argus" %1\sql\npc_list.sql %2\mob-list-236.xml
java -cp "." DarkstarNpcIdUpdate "Metalworks" "Vicious_Eye" %1\sql\npc_list.sql %2\mob-list-237.xml
java -cp "." DarkstarNpcIdUpdate "Windurst Waters" "Ajido-Marujido" %1\sql\npc_list.sql %2\mob-list-238.xml
java -cp "." DarkstarNpcIdUpdate "Windurst Walls" "Zokima-Rokima" %1\sql\npc_list.sql %2\mob-list-239.xml
java -cp "." DarkstarNpcIdUpdate "Port Windurst" "Goltata" %1\sql\npc_list.sql %2\mob-list-240.xml
java -cp "." DarkstarNpcIdUpdate "Windurst Woods" "Kohlo-Lakolo" %1\sql\npc_list.sql %2\mob-list-241.xml
java -cp "." DarkstarNpcIdUpdate "Heavens Tower" "Lion" %1\sql\npc_list.sql %2\mob-list-242.xml
java -cp "." DarkstarNpcIdUpdate "Ru'Lude Gardens" "Nelcabrit" %1\sql\npc_list.sql %2\mob-list-243.xml
java -cp "." DarkstarNpcIdUpdate "Upper Jeuno" "Monberaux" %1\sql\npc_list.sql %2\mob-list-244.xml
java -cp "." DarkstarNpcIdUpdate "Lower Jeuno" "Wolfgang" %1\sql\npc_list.sql %2\mob-list-245.xml
java -cp "." DarkstarNpcIdUpdate "Port Jeuno" "Rinzei" %1\sql\npc_list.sql %2\mob-list-246.xml
java -cp "." DarkstarNpcIdUpdate "Rabao" "Angry_Goat" %1\sql\npc_list.sql %2\mob-list-247.xml
java -cp "." DarkstarNpcIdUpdate "Selbina" "Thunder_Hawk" %1\sql\npc_list.sql %2\mob-list-248.xml
java -cp "." DarkstarNpcIdUpdate "Mhaura" "Hyria" %1\sql\npc_list.sql %2\mob-list-249.xml
java -cp "." DarkstarNpcIdUpdate "Kazham" "Khau_Mahiyoeloh" %1\sql\npc_list.sql %2\mob-list-250.xml
java -cp "." DarkstarNpcIdUpdate "Hall of The Gods" "Zeid" %1\sql\npc_list.sql %2\mob-list-251.xml
java -cp "." DarkstarNpcIdUpdate "Norg" "Gilgamesh" %1\sql\npc_list.sql %2\mob-list-252.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Uleguerand" "Conflux_Surveyor" %1\sql\npc_list.sql %2\mob-list-253.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Grauberg" "Time Master Debug" %1\sql\npc_list.sql %2\mob-list-254.xml
java -cp "." DarkstarNpcIdUpdate "Abyssea - Empyreal Paradox" "Trailmix" %1\sql\npc_list.sql %2\mob-list-255.xml
goto exit

:usage
echo "usage: DarkstarNpcIdUpdate.bat <DarkStarRootDir> <POLUtilsDumpRootDir> (Use mass-extractor.exe)"

:exit