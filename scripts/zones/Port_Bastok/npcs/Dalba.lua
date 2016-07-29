-----------------------------------
--  Area: Port Bastok
--   NPC: Dalba
--  Type: Past Event Watcher
-- @zone: 236
--  @pos: -174.101 -7 -19.611
-----------------------------------

package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;

require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    -- Bastok Missions.
    local BastokMissions = 0xFFFFFFFE; 
    if (player:hasCompletedMission(BASTOK,FETICHISM)) then
        BastokMissions = BastokMissions - 2; -- Fetichism.
    end
    if (player:hasCompletedMission(BASTOK,TO_THE_FORSAKEN_MINES)) then
        BastokMissions = BastokMissions - 4; -- To the Forsaken Mines.
    end

    -- Bastok Quests.
    local BastokQuests = 0xFFFFFFFE; 
    if (player:hasCompleteQuest(BASTOK,BEAUTY_AND_THE_GALKA)) then
        BastokQuests = BastokQuests - 2;         -- Beauty and the Galka.
    end
    if (player:hasCompleteQuest(BASTOK,WELCOME_TO_BASTOK)) then
        BastokQuests = BastokQuests - 4;         -- Welcome to Bastok.
    end
    if (player:hasCompleteQuest(BASTOK,GUEST_OF_HAUTEUR)) then
        BastokQuests = BastokQuests - 8;         -- Guest of Hauteur.
    end
    if (player:hasCompleteQuest(BASTOK,CID_S_SECRET)) then
        BastokQuests = BastokQuests - 16;        -- Cid's Secret.
    end
    if (player:hasCompleteQuest(BASTOK,THE_USUAL)) then
        BastokQuests = BastokQuests - 32;        -- The Usual.
    end
    if (player:hasCompleteQuest(BASTOK,LOVE_AND_ICE)) then 
        BastokQuests = BastokQuests - 64;        -- Love and Ice(pt.1).
        BastokQuests = BastokQuests - 128;     -- Love and Ice(pt.2).
    end
    if (player:hasCompleteQuest(BASTOK,A_TEST_OF_TRUE_LOVE)) then 
        BastokQuests = BastokQuests - 256;       -- A Test of True Love(pt.1).
        BastokQuests = BastokQuests - 512;     -- A Test of True Love(pt.2).
        BastokQuests = BastokQuests - 1024;     -- A Test of True Love(pt.3).
    end
    if (player:hasCompleteQuest(BASTOK,LOVERS_IN_THE_DUSK)) then 
        BastokQuests = BastokQuests - 2048;      -- Lovers in the Dusk
    end
    if (player:hasCompleteQuest(BASTOK,GHOSTS_OF_THE_PAST)) then
        BastokQuests = BastokQuests - 4096;      -- Ghosts of the Past(pt.1).
        BastokQuests = BastokQuests - 8192;     -- Ghosts of the Past(pt.2).
    end
    if (player:hasCompleteQuest(BASTOK,THE_FIRST_MEETING)) then
        BastokQuests = BastokQuests - 16384;     -- The First Meeting(pt.1).
        BastokQuests = BastokQuests - 32768;     -- The First Meeting(pt.2).
    end
    if (player:hasCompleteQuest(BASTOK,AYAME_AND_KAEDE)) then
        BastokQuests = BastokQuests - 65536;     -- Ayame and Kaede(pt.1).
        BastokQuests = BastokQuests - 131072;     -- Ayame and Kaede(pt.2).
        BastokQuests = BastokQuests - 262144;     -- Ayame and Kaede(pt.3).
        BastokQuests = BastokQuests - 524288;     -- Ayame and Kaede(pt.4).
        BastokQuests = BastokQuests - 1048576;     -- Ayame and Kaede(pt.5).
    end
-- *Need to determine the correct csid/appropriate options for this cutscene
    --if (player:hasCompleteQuest(BASTOK,TRIAL_BY_EARTH)) then
    --    BastokQuests = BastokQuests - 2097152;   -- Trial by Earth.
    --end
    if (player:hasCompleteQuest(BASTOK,THE_WALLS_OF_YOUR_MIND)) then
        BastokQuests = BastokQuests - 4194304;   -- The Walls of Your Mind(pt.1).
        BastokQuests = BastokQuests - 8388608;     -- The Walls of Your Mind(pt.2).
        BastokQuests = BastokQuests - 16777216;     -- The Walls of Your Mind(pt.3).
    end
    if (player:hasCompleteQuest(BASTOK,FADED_PROMISES)) then
        BastokQuests = BastokQuests - 33554432;  -- Faded Promises.
    end
    if (player:hasCompleteQuest(BASTOK,OUT_OF_THE_DEPTHS)) then
        BastokQuests = BastokQuests - 67108864;  -- Out of the Depths(pt.1).

-- *Need to determine the appropriate options for this cutscene
        -- BastokQuests = BastokQuests - 134217728; -- Out of the Depths(pt.2).
    end

    -- Other Quests.
    local OtherQuests = 0xFFFFFFFE;
    if (player:hasCompleteQuest(WINDURST,THE_PUPPET_MASTER)) then
        OtherQuests = OtherQuests - 2; -- The Puppet Master(pt.1).
        OtherQuests = OtherQuests - 4; -- The Puppet Master(pt.2).
    end
    if (player:hasCompleteQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS)) then
        OtherQuests = OtherQuests - 8;  -- 20 in Pirate Years(pt.1).
        OtherQuests = OtherQuests - 16;    -- 20 in Pirate Years(pt.2).
    end
    if (player:hasCompleteQuest(OUTLANDS,I_LL_TAKE_THE_BIG_BOX)) then
        OtherQuests = OtherQuests - 32; -- I'll Take the Big Box.
    end

-- *Need the correct csids 
    -- if (player:hasCompleteQuest(BASTOK,CHASING_DREAMS)) then
    --     OtherQuests = OtherQuests - 64;  -- Chasing Dreams(pt.1).
    --     OtherQuests = OtherQuests - 128; -- Chasing Dreams(pt.2).
    -- end

-- *This quest,as of the time this script was written,is not yet defined in the Darkstar Project.
    -- if (player:hasCompleteQuest(**Unknown**,MONSTROSITY)) then
    --     OtherQuests = OtherQuests - 256; -- Monstrosity.
    -- end

    -- Promathia Missions.    
    local PromathiaMissions = 0xFFFFFFFE;
    if (player:hasCompletedMission(COP,THE_CALL_OF_THE_WYRMKING)) then
        PromathiaMissions = PromathiaMissions - 2; -- The Call of the Wyrmking.
    end
    if (player:hasCompletedMission(COP,THE_ENDURING_TUMULT_OF_WAR)) then
        PromathiaMissions = PromathiaMissions - 4; -- The Enduring Tumult of War.
    end

    -- Add-on Scenarios.
    local AddonScenarios = 0xFFFFFFFE;
    if (player:hasCompletedMission(AMK,DRENCHED_IT_BEGAN_WITH_A_RAINDROP)) then
        AddonScenarios = AddonScenarios - 2; -- Drenched! It Began with a Raindrop.
    end
-- *Need the correct csid
--    if (player:hasCompletedMission(AMK,HASTEN_IN_A_JAM_IN_JEUNO)) then
--        AddonScenarios = AddonScenarios - 4; -- Hasten! In a Jam in Jeuno?
--    end

    -- Determine if any cutscenes are available for the player.
    local gil = player:getGil();
    if (BastokMissions    == 0xFFFFFFFE and 
        BastokQuests      == 0xFFFFFFFE and
        OtherQuests       == 0xFFFFFFFE and
        PromathiaMissions == 0xFFFFFFFE and
        AddonScenarios    == 0xFFFFFFFE)
    then -- Player has no cutscenes available to be viewed.
        gil = 0; -- Setting gil to a value less than 10(cost) will trigger the appropriate response from this npc.
    end

    player:startEvent(0x0104,BastokMissions,BastokQuests,OtherQuests,PromathiaMissions,AddonScenarios,0xFFFFFFFE,10,gil); 
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (player:delGil(10) == false) then
        player:setLocalVar("Dalba_PlayCutscene", 2) ; -- Cancel the cutscene.
        player:updateEvent(0);
    else
        player:setLocalVar("Dalba_PlayCutscene", 1) 
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (player:getLocalVar("Dalba_PlayCutscene") < 2) then
        if (   option ==   1) then        -- Fetichism.
            player:startEvent(0x03F0); 
        elseif (option ==   2) then        -- To the Forsaken Mines.
            player:startEvent(0x03F2);
        elseif (option ==  33) then        -- Beauty and the Galka.
            player:startEvent(0x0002);            
        elseif (option ==  34) then        -- Welcome to Bastok.
            player:startEvent(0x0034);                   
        elseif (option ==  35) then        -- Guest of Hauteur.
            player:startEvent(0x0037);                    
        elseif (option ==  36) then        -- Cid's Secret.
            player:startEvent(0x0085);                     
        elseif (option ==  37) then        -- The Usual.
            player:startEvent(0x0088);                           
        elseif (option ==  38) then        -- Love and Ice(pt.1).
            player:startEvent(0x00B9);                  
        elseif (option ==  39) then        -- Love and Ice(pt.2).
            player:startEvent(0x00BA);                  
        elseif (option ==  40) then        -- A Test of True Love(pt.1).
            player:startEvent(0x010E);           
        elseif (option ==  41) then        -- A Test of True Love(pt.2).
            player:startEvent(0x0110);           
        elseif (option ==  42) then        -- A Test of True Love(pt.3).
            player:startEvent(0x0112);           
        elseif (option ==  43) then        -- Lovers in the Dusk.
            player:startEvent(0x0113);                  
        elseif (option ==  44) then        -- Ghosts of the Past(pt.1).
            player:startEvent(0x00E7);            
        elseif (option ==  45) then        -- Ghosts of the Past(pt.2).
            player:startEvent(0x00E8);            
        elseif (option ==  46) then        -- The First Meeting(pt.1).
            player:startEvent(0x00E9);             
        elseif (option ==  47) then        -- The First Meeting(pt.2).
            player:startEvent(0x00EA);             
        elseif (option ==  48) then        -- Ayame and Kaede(pt.1).
            player:startEvent(0x00F0);               
        elseif (option ==  49) then        -- Ayame and Kaede(pt.2).
            player:startEvent(0x00F1);               
        elseif (option ==  50) then        -- Ayame and Kaede(pt.3).
            player:startEvent(0x00F2);               
        elseif (option ==  51) then        -- Ayame and Kaede(pt.4). 
            player:startEvent(0x00F5);              
        elseif (option ==  52) then        -- Ayame and Kaede(pt.5).
            player:startEvent(0x00F6);               
        -- elseif (option ==  53) then        -- Trial by Earth.
        --     player:startEvent(0x00FA,0,TUNING_FORK_OF_EARTH,1);                    
        elseif (option ==  54) then        -- The Walls of Your Mind(pt.1).
            player:startEvent(0x011E);        
        elseif (option ==  55) then        -- The Walls of Your Mind(pt.2).
            player:startEvent(0x0121);        
        elseif (option ==  56) then        -- The Walls of Your Mind(pt.3).
            player:startEvent(0x0122);        
        elseif (option ==  57) then        -- Faded Promises.
            player:startEvent(0x0128);                      
        elseif (option ==  58) then        -- Out of the Depths(pt.1).
            player:startEvent(0x0133);             
        -- elseif (option ==  59) then        -- Out of the Depths(pt.2).
        --     player:startEvent(0x0135,0,0,0,601); -- 601 = Old Nametag      
        elseif (option ==  65) then        -- The Puppet Master(pt.1).
            player:startEvent(0x0100,0,TUNING_FORK_OF_EARTH,0,1169,0,0,0,0); -- 1169 = Earth Pendulum            
        elseif (option ==  66) then        -- The Puppet Master(pt.2).
            player:startEvent(0x0102);            
        elseif (option ==  67) then        -- 20 in Pirate Years(pt.1).
            player:startEvent(0x0105);        
        elseif (option ==  68) then        -- 20 in Pirate Years(pt.2).
            player:startEvent(0x0107);        
        elseif (option ==  69) then        -- I'll Take the Big Box.
            player:startEvent(0x0108);           
        -- elseif (option ==  70) then        -- Chasing Dreams(pt.1).
        --     player:startEvent(CSID);            
        -- elseif (option ==  71) then        -- Chasing Dreams(pt.2).
        --     player:startEvent(CSID);            
        -- elseif (option ==  72) then        -- Monstrosity.
        --     player:startEvent(CSID);                     
        elseif (option ==  97) then        -- The Call of the Wyrmking.
            player:startEvent(0x0131);          
        elseif (option ==  98) then        -- The Enduring Tumult of War.
            player:startEvent(0x0132);        
        elseif (option == 129) then        -- Drenched! It Began with a Raindrop.
            player:startEvent(0x7549,0,0,0,0,0,0,236);
--        elseif (option ==   2) then        -- Hasten! In a Jam in Jeuno?
--            player:startEvent(CSID,0,0,0,0,0,0,236);
        end
    end

    player:setLocalVar("Dalba_PlayCutscene", 0)
end;
