require("scripts/globals/common");
require("scripts/globals/settings");

---## TODO:
--* Force confrontation on npcs inside garrison. npc:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800); 0
--* Prevent Fellows/trusts and disallow garrison during ballista
--* Add SQL tables for ally npcs to spawn, update script to instantiateMob the new npcs
--* Ensure SQL flag for confrontation is removed on zone, can update similar to this (allows confrontation to wipe on zoning):
--        update status_effects set flags = flags | integer_value_for_EFFECTFLAG_ON_ZONE where statusid = integer_value_for_EFFECT_BATTLEFIELD;
--* Once NPC allies are in change updateClaim to attack NPC's instead of player
--* Update ALL mobs pos in sql
--* Update instantiateMob to return newMob
--* Build out other conquest npc scripts per region OP npc


-->>>>UPDATE Mob scripts
--setDropID(4596)

--## Garrison Scenarios to gather
--* Cutscene ID/params on finish 
--* All NPC model's that spawn need to be found and added to sql (currently have a handful for 3-4 zones)


------------------------
-- Garrison States
-- Used in updateGarrison to maintain progress of garrison
------------------------

START_GARRISON = 0
PREP_GARRISON = 1
START_WAVE = 2
CHECK_WAVE = 3
START_DELAYED_WAVE = 4
END_GARRISON = 5
GARRISON_COOLDOWN = 6
IDLE_GARRISON = 7

------------------------
-- onGarrisonTrade
-- Used to confirm item trades to initiate garrison
------------------------

function onGarrisonTrade(npc, player, trade)

    local proper_item_used = false
    local result = 0 -- 0: Unknown Error, 1: Success, 2: Wrong Nation, 3: Garrison on Cooldown for player, 4: Garrison on Cooldown for zone, 5: Wrong Item
    local garrisonWeeklyTimer = "[GARRISON]Cooldown" --player can only initiate garrison once a conquest week
    local garrison_state = npc:getLocalVar('GarrisonState')

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

    if (trade:getItemCount() == 1 and trade:getGil() == 0 and trade:hasItemQty(garrison_trades[player:getZoneID()], 1)) then
        proper_item_used = true
    end

    if (player:getNation() ~= GetRegionOwner(npc:getCurrentRegion())) then
        result = 2

    elseif (player:getVar(garrisonWeeklyTimer) >= os.time()) then
        result = 3

    elseif (garrison_state == GARRISON_COOLDOWN) then
        result = 4

    elseif (garrison_state == IDLE_GARRISON and proper_item_used) then

        player:setVar("garrisonWeeklyTimer", getConquestTally())

        startGarrison(npc, player)
        npc:timer(1800000, function(npc)
                            npc:setLocalVar('GarrisonState', IDLE_GARRISON) -- Next garrison can be begin 30 minutes after prior garrison initilized
                        end)
        result = 1
    else
        result = 5
    end

    return proper_item_used,result

end;

----------------------
-- onGarrisonTrigger()
-- Guard response when triggered during garrison
----------------------

function onGarrisonTrigger(npc, player)

    local result = 0
    local garrison_state = npc:getLocalVar("GarrisonState")
    local garrison_starter = npc:getLocalVar("GarrisonInitiator")

    if (garrison_state == PREP_GARRISON and not player:hasStatusEffect(EFFECT_CONFRONTATION)) then
        addGarrisonPlayer(npc, player)
        result = 1

    elseif (garrison_state == END_GARRISON) then

        if (player:getID() == garrison_starter) then
            giveGarrisonLoot(npc, player, 1, 1) --  hard coded to 1/1 npc survived until npc instantiateMob is setup
            npc:setLocalVar("GarrisonState", GARRISON_COOLDOWN)
            result = 2
        end

        if (player:hasStatusEffect(EFFECT_CONFRONTATION)) then
            delGarrisonPlayer(npc, player)
            result = 4
        end

    elseif (garrison_state == GARRISON_COOLDOWN and player:hasStatusEffect(EFFECT_CONFRONTATION)) then
        delGarrisonPlayer(npc, player)
        result = 4

    end

    return result
end


----------------------
-- getGarrisonMobs()
-- Returns garrison mob list for specified zone
----------------------

function getGarrisonBossID(zone)

    local garrison_bosses = {[113] = 17240433,
                            [124] = 17285570,
                            [112] = 17236228,
                            [114] = 17244548,
                            [111] = 17232146,
                            [123] = 17281490,
                            [121] = 17273304,
                            [126] = 17293639,
                            [104] = 17203676,
                            [109] = 17224160,
                            [119] = 17265111,
                            [103] = 17199601,
                            [118] = 17261034,
                            [100] = 17187282,
                            [106] = 17211857,
                            [115] = 17248606};


    return garrison_bosses[zone]
end


------------------------
-- giveGarrisonLoot()
-- distribute garrison reward into player pool based off how many npc's lived
------------------------

function giveGarrisonLoot(npc, player, npcs_alive, npcs_initial)

    local zone = npc:getZoneID()
    local level_cap = player:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getPower();
    local garrison_loot = {
                    [20] = {13818,15147,14314,14841,14206}, -- Level cap 20 =  Garrison Tunica, Garrison Sallet, Garrison Hose, Garrison Gloves, Garrison Boots
                    [30] = {17580,18212,18090,17272,17940,17839}, -- Level cap 30 = Military Pole, Military Axe, Military Spear, Military Gun, Military Pick, Military Harp
                    [40] = {14757,14652,14653,13681,13680}, -- Level cap 40 = Mecurial Earring, Protean Ring, Variable Ring, Variable Cape, Variable Mantle
                    [50] = {14755,14756,14744,14745,14747,14748,14749,14750,14752,14753,14754,14746,14751}, -- Level cap 50 = Refresh Earring, Accurate Earring, Undead Earring, Arcana Earring, Bird Earring, Amorph Earring, Lizard Earring, Aquan Earring, Beast Earring, Demon Earring, Dragon Earring, Vermin Earring, Plantoid Earring
                    [75] = {18213,17204,17465,18000,18091,18352,17941,17581,18374,17697,18049,17824,17791}, -- Level cap 75 = Mighty Axe, Mighty Bow, Mighty Cudgel, Mighty Knife, Mighty Lance, Mighty Patas, Mighty Pick, Mighty Pole, Mighty Sword, Mighty Talwar, Mighty Zaghnal, Nukemaru, Rai Kunimitsu
                    }


    -- Percentage of how many npcs were kept alive
    local evaluation = (( 100.00 / npcs_initial ) * npcs_alive)

    -- Distribute treasure pool
    local reward_count = math.floor(evaluation  / (100 / ((player:checkSoloPartyAlliance() + 1) * 2)))

    if (reward_count == 0) then
        reward_count = 1 -- minimum reward is 1 item
    end

    for i = 1, reward_count do

        player:addTreasure(garrison_loot[level_cap][math.random(1,#garrison_loot[level_cap])], npc)
    end

    local exp_scroll = 4198 -- Dragon Chronicles
    if (level_cap == 75) then
        exp_scroll = 4247 -- Miratete's Memoirs
    end

    for i = 1, math.random(1,2) do
        player:addTreasure(exp_scroll, npc)
    end


    -- Distribute gil
    local reward_gil = (3200 * (evaluation / 100))
    local partyCheck = player:checkSoloPartyAlliance()

    if (partyCheck == 2) then

        for _,alliance_member in player:getAlliance() do
            if (alliance_member:hasStatusEffect(EFFECT_CONFRONTATION) and alliance_member:getZoneID() == zone) then
                alliance_member:addGil(GIL_RATE * reward_gil)
            end
        end

    elseif (partyCheck == 1)  then

        for _,party_member in player:getParty() do
            if(party_member:hasStatusEffect(EFFECT_CONFRONTATION) and alliance_member:getZoneID() == zone) then
                party_member:addGil(GIL_RATE * reward_gil)
            end
        end

    else

        player:addGil(GIL_RATE * reward_gil)

    end

    return
end

------------------------
-- addGarrisonPlayer
-- perform steps to lock players into garrison
------------------------

function addGarrisonPlayer(npc, player)

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
                       [115] = 20}

    player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,garrison_caps[npc:getZoneID()],0,1800)
    player:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800)
    --player:instantiateMob(groupid)

    return
end


------------------------
-- delGarrisonPlayer
-- perform steps to remove players from garrison
------------------------

function delGarrisonPlayer(npc, player)

    player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    player:delStatusEffectSilent(EFFECT_CONFRONTATION);
    --player:instantiateMob(groupid) --delete npcs

    return
end


------------------------
-- startGarrison
-- Starts the garrison and it's first wave
------------------------

function startGarrison(npc, player)

    npc:setLocalVar("GarrisonInitiator", player:getID())
    npc:setLocalVar("GarrisonState", START_GARRISON)
	
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
                       [115] = 20}

    local partyCheck = player:checkSoloPartyAlliance();
    local zone_id = npc:getZoneID()

    --TODO: add player:instantiateMob(), instantiateMob takes 1 parameter: the groupid of the mob you want to spawn
    if (partyCheck == 2) then

        for _,alliance_member in ipairs(player:getAlliance()) do
            if (alliance_member:getZoneID() == zone_id) then
                alliance_member:addStatusEffect(EFFECT_LEVEL_RESTRICTION,garrison_caps[npc:getZoneID()],0,1800)
                alliance_member:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800)
            end
        end

    elseif (partyCheck == 1)  then

        for _,party_member in ipairs(player:getParty()) do

            if (party_member:getZoneID() == zone_id) then

                party_member:addStatusEffect(EFFECT_LEVEL_RESTRICTION,garrison_caps[npc:getZoneID()],0,1800)
                party_member:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800)
            end
        end

    else

        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,garrison_caps[npc:getZoneID()],0,1800)
        player:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800)
        player:messageSpecial(314, 21818)
    end

    npc:setLocalVar("GarrisonState", PREP_GARRISON)
    updateGarrison(npc)

end


-----------------------
-- startGarrisonWave
-- Start the specified wave and spawn the base monsters
------------------------

function startGarrisonWave(npc, player)

    local GARRISON_BOSS = getGarrisonBossID(player:getZoneID())
    local npc_id = npc:getID()
    local wave = npc:getLocalVar("WaveNumber")
    local mob_row_count = player:getAllianceSize()
    local mob_position = GetMobByID(GARRISON_BOSS):getSpawnPos()
    local front_count = 0
    local back_count = 0
    local required_kills = (2 * player:getAllianceSize()) + ((wave - 1) * 2)

    if (wave == 4) then -- Wave 4 should have same amount of mobs as wave 3, a simple way to fix the math
        required_kills = required_kills - 2
    end

    npc:setLocalVar("WaveStartTime", os.time())
    npc:setLocalVar("WaveState", 1)
    npc:setLocalVar("RequiredKills", required_kills)
    npc:setLocalVar("WaveKillCount", 0)


    -- spawn front row of mobs
    for offset = 8, 1, -1 do
        local MobID = GARRISON_BOSS - offset
        local Mob = GetMobByID(MobID)
        
        if (not Mob:isSpawned() and front_count < mob_row_count) then

            Mob:setSpawn(mob_position.x, mob_position.y + (front_count * 3), mob_position.z, mob_position.rot)
            SpawnMob(MobID):updateClaim(player)
            Mob:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800);
            Mob:setLocalVar("GarrisonNPCID", npc_id)
            front_count = front_count + 1
        end
    end

    -- spawn back row of mobs
    for offset = 8, 1, -1 do
        local MobID = GARRISON_BOSS - offset
        local Mob = GetMobByID(MobID)
        
        if (not Mob:isSpawned() and back_count < mob_row_count) then

            Mob:setSpawn(mob_position.x + 3, mob_position.y + (back_count * 3), mob_position.z, mob_position.rot)
            SpawnMob(MobID):updateClaim(player)
            Mob:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800);
            Mob:setLocalVar("GarrisonNPCID", npc_id)
            back_count = back_count + 1
        end
    end

    npc:setLocalVar("GarrisonState", CHECK_WAVE)
    updateGarrison(npc)

end


------------------------
-- spawnDelayedWave
-- Used to spawn mobs that pop mobs after the inital base wave
------------------------

function spawnDelayedWave(npc, player)

    local GARRISON_BOSS = getGarrisonBossID(player:getZoneID())

    npc:setLocalVar("WaveState", npc:getLocalVar("WaveState") + 1)

    local spawned_count = 0
    local mob_position = GetMobByID(GARRISON_BOSS):getSpawnPos()

    for offset = 8, 1, -1 do
        local MobID = GARRISON_BOSS - offset
        local Mob = GetMobByID(MobID)
        
        if (not Mob:isSpawned()) then

            spawned_count  = spawned_count + 1
            Mob:setSpawn(mob_position.x + (spawned_count * 3), mob_position.y, mob_position.z, mob_position.rot)
            SpawnMob(MobID):updateClaim(player)
            Mob:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800);
            Mob:setLocalVar("GarrisonNPCID", npc:getID())
            if (spawned_count == 2) then
                npc:setLocalVar("GarrisonState", CHECK_WAVE)
                updateGarrison(npc)
                return --Every delayed wave spawns 2 more mobs, after we find two available mobs to spawn stop trying to spawn mobs
            end

        end
    end
end

------------------------
-- checkGarrison
-- Used in mob scripts to update the garrison's status
------------------------

function checkGarrison(npc, player)

    local GARRISON_BOSS = getGarrisonBossID(player:getZoneID())

    local GarrisonBoss = GetMobByID(GARRISON_BOSS)
    local wave = npc:getLocalVar("WaveNumber")
    local wave_start_time = npc:getLocalVar("WaveStartTime")
    local wave_state = npc:getLocalVar("WaveState")

    if (npc:getLocalVar("WaveKillCount") == npc:getLocalVar("RequiredKills")) then
        if (wave <= 3) then
            npc:setLocalVar("WaveNumber", wave + 1)
            npc:setLocalVar("GarrisonState", START_WAVE)

        elseif (not GarrisonBoss:isSpawned()) then
            SpawnMob(GARRISON_BOSS):updateClaim(player)
            GarrisonBoss:addStatusEffectEx(EFFECT_CONFRONTATION,0,1000,0,1800);
            GarrisonBoss:setLocalVar("GarrisonNPCID", npc:getID())
        end
    end


    if (wave >= 2 and wave_state == 1 and wave_start_time + 10 <= os.time()) then
        npc:setLocalVar("GarrisonState", START_DELAYED_WAVE)

    elseif (wave >= 3 and wave_state == 2 and wave_start_time + 20 <= os.time()) then -- update to require kill count  only if killcount above 8 aka alliance ofr 3 parties

        local partyCheck = player:checkSoloPartyAlliance()
        if (partyCheck < 2 or partyCheck == 2 and npc:getLocalVar("WaveKillCount") >= 2) then
            npc:setLocalVar("GarrisonState", START_DELAYED_WAVE)
        end

    end
    updateGarrison(npc)
end


------------------------
-- updateGarrison
-- manages entire garrison
------------------------

function updateGarrison(npc)

    local states = {
                    [PREP_GARRISON] = {delay = 20, stateFunc = function(npc)
                                                                    npc:setLocalVar("GarrisonState", START_WAVE)
                                                                    npc:setLocalVar("WaveNumber", 1)
                                                                    updateGarrison(npc)
                                                                end},
                    [START_WAVE] = {delay = 15, stateFunc = startGarrisonWave},
                    [CHECK_WAVE] = {delay = 10, stateFunc = checkGarrison},
                    [START_DELAYED_WAVE] = {delay = 10, stateFunc = spawnDelayedWave},
                    [END_GARRISON] = {delay = 1, stateFunc = function(npc)
                                                                print("updateGarrison: END_GARRISON signaled...\n")
                                                                return
                                                            end}
    }

    local current_state = npc:getLocalVar("GarrisonState")
    local state_data = states[current_state]

    npc:timer(state_data.delay * 1000, function(npc)
        local player = GetPlayerByID(npc:getLocalVar("GarrisonInitiator"))
        state_data.stateFunc(npc, player)

    end)
end


------------------------
-- doGarrisonCutscene
-- Handles all csid details for all outpost guards
------------------------

function doGarrisonCutscene(npc, player)

    --!cs 32753 Zone_ID unknown1 Region_ID Text
    player:startEvent(32753, npc:getZoneID(), 6, npc:getCurrentRegion(), player:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getPower())
    return
end
