require("scripts/globals/common");

---## TODO:
--* Force confrontation on players/npcs/mobs inside garrison. player:addStatusEffectEx(EFFECT_CONFRONTATION) --find the param for icon to set to 0
--* Prevent Fellows/trusts

--## Garrison Scenarios to gather
--* Cutscene ID/params on entrance, not qualified for trading/rank, on finish csid
--* Mob spawn order (front line, backline, delayed) for 1 party, 2 party, 3 party
--* Will the mobs with delay spawn if all 8 mobs are already spawned?

------------------------
-- getGarrisonMobs
------------------------

function getGarrisonWave(player, wave)

    local zone = player:getZoneID();

    local mob_count = ((2 * player:getAllianceSize()) + ((wave - 1) * 2))  
    local wave_mobs = {'frontrow': {},
                  'backrow': {},
                  'delayed': {} };

     local all_garrison_mobs = {[113] = {17240425, 17240426, 17240427, 17240428, 17240429, 17240430, 17240431, 17240432, 17240433},
                            [124] = {17285562, 17285563, 17285564, 17285565, 17285566, 17285567, 17285568, 17285569, 17285570},
                            [112] = {17236220, 17236221, 17236222, 17236223, 17236224, 17236225, 17236226, 17236227, 17236228},
                            [114] = {17244540, 17244541, 17244542, 17244543, 17244544, 17244545, 17244546, 17244547, 17244548},
                            [111] = {17232138, 17232139, 17232140, 17232141, 17232142, 17232143, 17232144, 17232145, 17232146},
                            [123] = {17281482, 17281483, 17281484, 17281485, 17281486, 17281487, 17281488, 17281489, 17281490},
                            [121] = {17273296, 17273297, 17273298, 17273299, 17273300, 17273301, 17273302, 17273303, 17273304},
                            [126] = {17293631, 17293632, 17293633, 17293634, 17293635, 17293636, 17293637, 17293638, 17293639},
                            [104] = {17203668, 17203669, 17203670, 17203671, 17203672, 17203673, 17203674, 17203675, 17203676},
                            [109] = {17224152, 17224153, 17224154, 17224155, 17224156, 17224157, 17224158, 17224159, 17224160},
                            [119] = {17265103, 17265104, 17265105, 17265106, 17265107, 17265108, 17265109, 17265110, 17265111},
                            [103] = {17199593, 17199594, 17199595, 17199596, 17199597, 17199598, 17199599, 17199600, 17199601},
                            [118] = {17261026, 17261027, 17261028, 17261029, 17261030, 17261031, 17261032, 17261033, 17261034},
                            [100] = {17187274, 17187275, 17187276, 17187277, 17187278, 17187279, 17187280, 17187281, 17187282},
                            [106] = {17211849, 17211850, 17211851, 17211852, 17211853, 17211854, 17211855, 17211856, 17211857},
                            [115] = {17248598, 17248599, 17248600, 17248601, 17248602, 17248603, 17248604, 17248605, 17248606}};
                          

    local garrison_mobs = all_garisson_mobs[zone];
 
    --for i, mobid in ipairs(garrison_mobs[zone_id]) do

    --end

    return wave_mobs
end;

------------------------
-- canStartGarrison
------------------------

function canStartGarrison(player)
    print("canStartGarrison: init\n");
    local zone_name = player:getZoneName();
    if (player:getNation() == GetRegionOwner(player:getCurrentRegion())) then
        if (player:getVar("[GARRISON]" .. zone_name .. "_Timer") <= os.time() and npc:getLocalVar('GarrisonCooldown') <= os.time()) then
            print("canStartGarrison: Success.\n");
            return true
        end
    end

    return false
end;

------------------------
-- onGarrisonTrade
------------------------

function onGarrisonTrade(player, trade)
    print("onGarrisonTrade: init\n");
    local zone_id = player:getZoneID();
    local zone_name = player:getZoneName();

    local garrison_trades = {
                            [115] = 1530, -- West Sarutabaruta =   7-Knot Quipu
                            [106] = 1529, -- North Gustaberg =  Darksteel Engraving
                            [100] = 1528, -- West Ronfaure =  Red Cryptex
                            [118] = 1534, -- Buburimu Peninsula =  Mithra Fang Sack
                            [103] = 1531, -- Valkurm Dunes =  Galka Fang Sack
                            [119] = 1535, -- Meriphataud Mountains =  Thirteen-Knot Quipus
                            [109] = 1533, -- Pashhow Marshlands =  Silver Engraving
                            [104] = 1532, -- Jugner Forest =  Jade Cryptex
                            [126] = 1538, -- Qufim Island =  Ram Leather Missive
                            [121] = 1539, -- The Sanctuary of Zi'Tah =  Hound Fang Sack
                            [123] = 1542, -- Yuhtunga Jungle =  Sheep Leather Missive
                            [111] = 1536, -- Beaucedine Glacier =  Tiger Leather Missive
                            [114] = 1540, -- Eastern Altepa Desert =  Dhalmel Leather Missive
                            [112] = 1537, -- Xarcabard =  Behemoth Leather Missive
                            [124] = 1543, -- Yhoator Jungle =  Coeurl Leather Missive
                            [113] = 1541}; -- Cape Teriggan =  Bunny Fang Sack

    if (canStartGarrison(player)) then
        print("onGarrisonTrade: item required = " .. garrison_trades[zone_id] .. ".\n");
        if (trade:getItemCount() == 1 and trade:getGil() == 0 and trade:hasItemQty(garrison_trades[zone_id], 1)) then
            print("onGarrisonTrade: contains required item.\n\tsetVar: [GARRISON]" .. zone_name .. "_Timer  Value: " .. getConquestTally())
            player:setVar("[GARRISON]" .. zone_name .. "_Timer", getConquestTally());
            npc:setLocalVar('GarrisonCooldown', os.time() + 1800); -- Garrison can only occur once every 30 minutes per zone
            return true
        end
    end 

    return false

end;


function applyGarrisonCap(player)
    local garrison_caps = {[113] = 75,
                       [124] = 50,
                       [112] = 50,
                       [114] = 50,
                       [111] = 40,
                       [123] = 40,
                       [121] = 40,
                       [126] = 30,
                       [104] = 30,
                       [109] = 30,
                       [119] = 30,
                       [103] = 30,
                       [118] = 30,
                       [100] = 20,
                       [106] = 20,
                       [115] = 20}; 

    

    for _,alliance_member in player:getAlliance() do
        alliance_member:addStatusEffect(EFFECT_LEVEL_RESTRICTION,garrison_caps[zone_id],0,1800);
        alliance_member:addStatusEffectEx(EFFECT_CONFRONTATION,0,1,0,1800);
    end
    
    return false
end
