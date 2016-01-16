-----------------------------------
-- Area: Selbina
--  NPC: Zaldon
-- Involved in Quests: Under the sea, A Boy's Dream
-- Starts and Finishes: Inside the Belly
-- @pos -13 -7 -5 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_ACCEPTED and player:hasKeyItem(ETCHED_RING) == false) then
        if (trade:hasItemQty(4501,1) == true and trade:getItemCount() == 1) then
            rand = math.random(1,5);
            if (rand == 3) then
                player:startEvent(0x0023); -- Ring found !
            else
                player:startEvent(0x0024); -- Ring not found...
            end
        end
    elseif (player:getVar("aBoysDreamCS") == 5 and trade:hasItemQty(4562,1) == true and trade:getItemCount() == 1) then
        player:startEvent(0x0055); -- CS for the quest "A Boy's Dream"
    -------------------------
    -- Begin Inside the Belly
    -------------------------
    elseif (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED or player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_COMPLETED) then
        if (trade:hasItemQty(5455,1) == true and trade:getItemCount() == 1) then -- Ahtapot
            rand = math.random(1,1000);
            if (rand > 1 and rand <= 107) then -- 10.7% chance
                player:setVar("ItB_Var",1);
                player:startEvent(0x00a6,0,2886); -- Mildewy Ingot
            elseif (rand > 107 and rand <= 301) then -- 19.4% chance
                player:setVar("ItB_Var",2);
                player:startEvent(0x00a6,0,2887); -- Decayed Ingot
            else
                player:setVar("ItB_Var",3);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4316,1) == true and trade:getItemCount() == 1) then -- Armored Pisces
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 4) then -- 0.4% chance
                player:setVar("ItB_Var",4);
                player:startEvent(0x00a6,0,13736); -- Stolid Breastplate
            else
                player:setVar("ItB_Var",5);
                player:startEvent(0x00a7); -- Gil Only
            end
----------- This section designed to conform to data found at http://wiki.ffxiclopedia.org/wiki/Inside_the_Belly regarding Drop Rates of Charts --
        elseif (trade:hasItemQty(4479,1) == true and trade:getItemCount() == 1) then -- Bhefhel Marlin
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 143 and player:hasItem(1873) == false) then -- 14.3% chance
                player:setVar("ItB_Var",6);
                player:startEvent(0x00a6,0,1873); -- Brigand's Chart
            elseif (rand > 143 and rand <= 187 and player:hasItem(1874) == false) then -- 4.4% chance
                player:setVar("ItB_Var",7);
                player:startEvent(0x00a6,0,1874); -- Pirate's Chart
            else
                player:setVar("ItB_Var",8);
                player:startEvent(0x00a7); -- Gil Only
            end
-------------------------------------------------------------------------------------------------------------------------------------------------
        elseif (trade:hasItemQty(4471,1) == true and trade:getItemCount() == 1) then -- Bladefish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 109) then -- 10.9% chance
                player:setVar("ItB_Var",9);
                player:startEvent(0x00a6,0,17002); -- Robber Rig
            else
                player:setVar("ItB_Var",10);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4309,1) == true and trade:getItemCount() == 1) then -- Cave Cherax
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 237) then -- 23.7% chance
                player:setVar("ItB_Var",11);
                player:startEvent(0x00a6,0,17007); -- Dwarf Pugil
            else
                player:setVar("ItB_Var",12);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5814,1) == true and trade:getItemCount() == 1) then -- Crocodilos
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 30) then -- 3.0% chance
                player:setVar("ItB_Var",13);
                player:startEvent(0x00a6,0,11654); -- Puffin Ring
            else
                player:setVar("ItB_Var",14);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4428,1) == true and trade:getItemCount() == 1) then -- Dark Bass
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 46) then -- 4.6% chance
                player:setVar("ItB_Var",15);
                player:startEvent(0x00a6,0,772); -- Green Rock
            else
                player:setVar("ItB_Var",16);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4454,1) == true and trade:getItemCount() == 1) then -- Emperor Fish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 10) then -- 1.0% chance; The wiki says 0%...
                player:setVar("ItB_Var",17);
                player:startEvent(0x00a6,0,12955); -- Cuir Highboots
            else
                player:setVar("ItB_Var",18);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4477,1) == true and trade:getItemCount() == 1) then -- Gavial Fish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 50) then -- 5.0% chance
                player:setVar("ItB_Var",19);
                player:startEvent(0x00a6,0,13361); -- Drone Earring
            else
                player:setVar("ItB_Var",20);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5471,1) == true and trade:getItemCount() == 1) then -- Gerrothorax
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 12) then -- 1.2% chance
                player:setVar("ItB_Var",21);
                player:startEvent(0x00a6,0,11492); -- Risky Patch
            else
                player:setVar("ItB_Var",22);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5799,1) == true and trade:getItemCount() == 1) then -- Giant Catfish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 66) then -- 6.6% chance
                player:setVar("ItB_Var",23);
                player:startEvent(0x00a6,0,17076); -- Earth Wand
            else
                player:setVar("ItB_Var",24);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4308,1) == true and trade:getItemCount() == 1) then -- Giant Chirai
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 12) then -- 1.2% chance
                player:setVar("ItB_Var",25);
                player:startEvent(0x00a6,0,1278); -- Spool of Twinthread
            else
                player:setVar("ItB_Var",26);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4306,1) == true and trade:getItemCount() == 1) then -- Giant Donko
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 48) then -- 4.8% chance
                player:setVar("ItB_Var",27);
                player:startEvent(0x00a6,0,1833); -- Broken Halcyon Fishing Rod
            else
                player:setVar("ItB_Var",28);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5475,1) == true and trade:getItemCount() == 1) then -- Gigant Octopus
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 100) then -- 10.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",29);
                player:startEvent(0x00a6,0,929); -- Jar of Black Ink
            else
                player:setVar("ItB_Var",30);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4474,1) == true and trade:getItemCount() == 1) then -- Gigant Squid
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 25) then -- 2.5% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",31);
                player:startEvent(0x00a6,0,12317); -- Flame shield
            else
                player:setVar("ItB_Var",32);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4304,1) == true and trade:getItemCount() == 1) then -- Grimmonite
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 50) then -- 5.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",33);
                player:startEvent(0x00a6,0,13456); -- Silver Ring
            else
                player:setVar("ItB_Var",34);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5127,1) == true and trade:getItemCount() == 1) then -- Gugrusaurus
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 4) then -- 0.4% chance
                player:setVar("ItB_Var",35);
                player:startEvent(0x00a6,0,1837); -- Saber Shoot
            else
                player:setVar("ItB_Var",36);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4480,1) == true and trade:getItemCount() == 1) then -- Gugru Tuna
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 50) then -- 5.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",37);
                player:startEvent(0x00a6,0,19186); -- Tiny Tathlum
            else
                player:setVar("ItB_Var",38);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5136,1) == true and trade:getItemCount() == 1) then -- Istavrit
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 100) then -- 10.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",39);
                player:startEvent(0x00a6,0,944); -- Pinch of Venom Dust
            else
                player:setVar("ItB_Var",40);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4307,1) == true and trade:getItemCount() == 1) then -- Jungle Catfish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 30) then -- 3.0% chance
                player:setVar("ItB_Var",41);
                player:startEvent(0x00a6,0,1832); -- Broken Hume Fishing Rod
            else
                player:setVar("ItB_Var",42);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5140,1) == true and trade:getItemCount() == 1) then -- Kalkanbaligi
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 33) then -- 3.3% chance
                player:setVar("ItB_Var",43);
                player:startEvent(0x00a6,0,16184); -- Flat Shield
            else
                player:setVar("ItB_Var",44);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5451,1) == true and trade:getItemCount() == 1) then -- Kilicbaligi
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 25) then -- 2.5% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",45);
                player:startEvent(0x00a6,0,16606); -- Rusty Greatsword
            else
                player:setVar("ItB_Var",46);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5450,1) == true and trade:getItemCount() == 1) then -- Lakerda
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 19) then -- 1.9% chance
                player:setVar("ItB_Var",47);
                player:startEvent(0x00a6,0,793); -- Black Pearl
            elseif (rand >= 20 and rand <= 69) then -- 5.0% chance; The wiki has an unknown percentage, but pearl should be greater than black pearl
                player:setVar("ItB_Var",48);
                player:startEvent(0x00a6,0,792); -- Pearl
            else
                player:setVar("ItB_Var",49);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5129,1) == true and trade:getItemCount() == 1) then -- Lik
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 5) then -- 0.5% chance
                player:setVar("ItB_Var",50);
                player:startEvent(0x00a6,0,1826); -- Spool of Opal Silk
            else
                player:setVar("ItB_Var",51);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5467,1) == true and trade:getItemCount() == 1) then -- Megalodon
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 30) then -- 3.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",52);
                player:startEvent(0x00a6,0,483); -- Broken Mithran Fishing Rod
            else
                player:setVar("ItB_Var",53);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4462,1) == true and trade:getItemCount() == 1) then -- Monke-Onke
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 100) then -- 10.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",54);
                player:startEvent(0x00a6,0,943); -- Pinch of Poison Dust
            else
                player:setVar("ItB_Var",55);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5134,1) == true and trade:getItemCount() == 1) then -- Mola Mola
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 18) then -- 1.8% chance
                player:setVar("ItB_Var",56);
                player:startEvent(0x00a6,0,16850); -- Mercurial Spear
            else
                player:setVar("ItB_Var",57);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4481,1) == true and trade:getItemCount() == 1) then -- Ogre Eel
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 25) then -- 2.5% chance
                player:setVar("ItB_Var",58);
                player:startEvent(0x00a6,0,13480); -- Turquoise Ring
            else
                player:setVar("ItB_Var",59);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5815,1) == true and trade:getItemCount() == 1) then -- Pelazoea
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 16) then -- 1.6% chance
                player:setVar("ItB_Var",60);
                player:startEvent(0x00a6,0,11655); -- Noddy Ring
            else
                player:setVar("ItB_Var",61);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5470,1) == true and trade:getItemCount() == 1) then -- Pirarucu
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 50) then -- 5.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",62);
                player:startEvent(0x00a6,0,1122); -- Wyvern Skin
            elseif (rand >= 51 and rand <= 75) then -- 2.5% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",63);
                player:startEvent(0x00a6,0,2523); -- Peiste Skin
            else
                player:setVar("ItB_Var",64);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5133,1) == true and trade:getItemCount() == 1) then -- Pterygotus
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 68) then -- 6.8% chance
                player:setVar("ItB_Var",65);
                player:startEvent(0x00a6,0,795); -- Lapis Lazuli
            else
                player:setVar("ItB_Var",66);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5135,1) == true and trade:getItemCount() == 1) then -- Rhinochimera
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 13) then -- 1.3% chance
                player:setVar("ItB_Var",67);
                player:startEvent(0x00a6,0,11624); -- Solon Torque
            else
                player:setVar("ItB_Var",68);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4305,1) == true and trade:getItemCount() == 1) then -- Ryugu Titan
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 13) then -- 1.3% chance
                player:setVar("ItB_Var",69);
                player:startEvent(0x00a6,0,18377); -- Mercurial Sword
            else
                player:setVar("ItB_Var",70);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4475,1) == true and trade:getItemCount() == 1) then -- Sea Zombie
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 238) then -- 23.8% chance
                player:setVar("ItB_Var",71);
                player:startEvent(0x00a6,0,17006); -- Drill Calamary
            else
                player:setVar("ItB_Var",72);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4451,1) == true and trade:getItemCount() == 1) then -- Silver Shark
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 13) then -- 1.3% chance
                player:setVar("ItB_Var",73);
                player:startEvent(0x00a6,0,16837); -- Trident
            else
                player:setVar("ItB_Var",74);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4463,1) == true and trade:getItemCount() == 1) then -- Takitaro
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 22) then -- 2.2% chance
                player:setVar("ItB_Var",75);
                player:startEvent(0x00a6,0,942); -- Philosopher's Stone
            else
                player:setVar("ItB_Var",76);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4478,1) == true and trade:getItemCount() == 1) then -- Three-eyed Fish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 100) then -- 10.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",77);
                player:startEvent(0x00a6,0,945); -- Pinch of Paralysis Dust
            else
                player:setVar("ItB_Var",78);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5120,1) == true and trade:getItemCount() == 1) then -- Titanic Sawfish
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 7) then -- 0.7% chance
                player:setVar("ItB_Var",79);
                player:startEvent(0x00a6,0,19290); -- Aizenkunitoshi
            else
                player:setVar("ItB_Var",80);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4476,1) == true and trade:getItemCount() == 1) then -- Titanictus
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 13) then -- 1.3% chance
                player:setVar("ItB_Var",81);
                player:startEvent(0x00a6,0,16533); -- Ancient Sword
            else
                player:setVar("ItB_Var",82);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4319,1) == true and trade:getItemCount() == 1) then -- Tricorn
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 40) then -- 4.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",83);
                player:startEvent(0x00a6,0,645); -- Chunk of Darksteel Ore
            else
                player:setVar("ItB_Var",84);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5137,1) == true and trade:getItemCount() == 1) then -- Turnabaligi
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 10) then -- 1.0% chance
                player:setVar("ItB_Var",85);
                player:startEvent(0x00a6,0,1262); -- Chunk of Dark Ore
            elseif (rand >= 11 and rand <= 24) then -- 1.4% chance
                player:setVar("ItB_Var",86);
                player:startEvent(0x00a6,0,1256); -- Chunk of Ice Ore
            elseif (rand >= 25 and rand <= 38) then -- 1.4% chance
                player:setVar("ItB_Var",87);
                player:startEvent(0x00a6,0,1260); -- Chunk of Water Ore
            else
                player:setVar("ItB_Var",88);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(5141,1) == true and trade:getItemCount() == 1) then -- Veydal Wrasse
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 50) then -- 5.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",89);
                player:startEvent(0x00a6,0,4361); -- Nebimonite
            elseif (rand >= 51 and rand <= 100) then -- 5.0% chance; The wiki has an unknown percentage
                player:setVar("ItB_Var",90);
                player:startEvent(0x00a6,0,888); -- Seashell
            else
                player:setVar("ItB_Var",91);
                player:startEvent(0x00a7); -- Gil Only
            end
        elseif (trade:hasItemQty(4385,1) == true and trade:getItemCount() == 1) then -- Zafmlug Bass
            rand = math.random(1,1000);
            if (rand >= 1 and rand <= 14) then -- 1.4% chance
                player:setVar("ItB_Var",92);
                player:startEvent(0x00a6,0,770); -- Blue Rock
            else
                player:setVar("ItB_Var",93);
                player:startEvent(0x00a7); -- Gil Only
            end

        end
    end
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    InsideTheBelly = player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY);
    TheRealGift =  player:getQuestStatus(OTHER_AREAS,THE_REAL_GIFT);
    mLvl = player:getMainLvl(); -- This should be fishingLvl = player:getSkillLevel(SKILL_FISHING); but fishing doesn't work yet.

    if (player:getVar("underTheSeaVar") == 3) then
        player:startEvent(0x0022,4501); -- During quest "Under the sea" - 3rd dialog
    elseif (mLvl >= 30 and TheRealGift == QUEST_COMPLETED and InsideTheBelly == QUEST_AVAILABLE) then -- This should be (fishingLvl >= 30)
        player:startEvent(0x00a1);
    elseif ((mLvl >= 30 and mLvl < 39) and (InsideTheBelly == QUEST_ACCEPTED or InsideTheBelly == QUEST_COMPLETED)) then -- This should be (fishingLvl >= 30 and fishingLvl < 39)
        player:startEvent(0x00a2,5799,4481,5802,4428);
    elseif ((mLvl >= 40 and mLvl < 49) and (InsideTheBelly == QUEST_ACCEPTED or InsideTheBelly == QUEST_COMPLETED)) then -- This should be (fishingLvl >= 40 and fishingLvl < 49)
        player:startEvent(0x00a3,5805,4385,5800,5802,5450); -- 5802(Istavrit) is skill cap 41, and therefore is used in this and the previous csid
    elseif ((mLvl >= 50 and mLvl <= 74) and (InsideTheBelly == QUEST_ACCEPTED or InsideTheBelly == QUEST_COMPLETED)) then -- This should be (fishingLvl >= 50 and fishingLvl < 75)
        player:startEvent(0x00a4,5806,5451,5801,5804,5807,5135);
    elseif (mLvl >= 75 and (InsideTheBelly == QUEST_ACCEPTED or InsideTheBelly == QUEST_COMPLETED)) then -- This should be (fishingLvl >= 75)
        player:startEvent(0x00a5,4451,4477,5803,4307,4478,5467,4304,4474);
    else
        player:startEvent(0x0096); -- Standard dialog
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0022) then
        player:setVar("underTheSeaVar",4);
    elseif (csid == 0x0024) then
        player:tradeComplete();
    elseif (csid == 0x0023) then
        player:addKeyItem(ETCHED_RING);
        player:messageSpecial(KEYITEM_OBTAINED,ETCHED_RING);
        player:tradeComplete();
    elseif (csid == 0x0055) then
        player:addKeyItem(KNIGHTS_BOOTS);
        player:messageSpecial(KEYITEM_OBTAINED,KNIGHTS_BOOTS);
        player:setVar("aBoysDreamCS",6);
        player:tradeComplete();
--------------------- Inside the Belly -----------------------------------------------------------------------------
    elseif (csid == 0x00a1) then
        player:addQuest(OTHER_AREAS,INSIDE_THE_BELLY);
--------------------------------------------------------------------------------------------------------------------
--------------------- Gil + Item(s) --------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
    elseif (csid == 0x00a6) then
        if (player:getVar("ItB_Var") == 1) then
            player:tradeComplete();
            player:addItem(2886);
            player:messageSpecial(ITEM_OBTAINED,2886);
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 2) then
            player:tradeComplete();
            player:addItem(2887);
            player:messageSpecial(ITEM_OBTAINED,2887);
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 4) then
            player:tradeComplete();
            player:addItem(13736);
            player:messageSpecial(ITEM_OBTAINED,13736);
            player:addGil(GIL_RATE*475);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*475);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 6) then
            player:tradeComplete();
            player:addItem(1873);
            player:messageSpecial(ITEM_OBTAINED,1873);
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 7) then
            player:tradeComplete();
            player:addItem(1874);
            player:messageSpecial(ITEM_OBTAINED,1874);
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 9) then
            player:tradeComplete();
            player:addItem(17002);
            player:messageSpecial(ITEM_OBTAINED,17002);
            player:addGil(GIL_RATE*200);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 11) then
            player:tradeComplete();
            player:addItem(17007);
            player:messageSpecial(ITEM_OBTAINED,17007);
            player:addGil(GIL_RATE*800);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*800);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 13) then
            player:tradeComplete();
            player:addItem(11654);
            player:messageSpecial(ITEM_OBTAINED,11654);
            player:addGil(GIL_RATE*1763);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*1763);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 15) then
            player:tradeComplete();
            player:addItem(772);
            player:messageSpecial(ITEM_OBTAINED,772);
            player:addGil(GIL_RATE*10);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*10);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 17) then
            player:tradeComplete();
            player:addItem(12955);
            player:messageSpecial(ITEM_OBTAINED,12955);
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 19) then
            player:tradeComplete();
            player:addItem(13361);
            player:messageSpecial(ITEM_OBTAINED,13361);
            player:addGil(GIL_RATE*250);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*250);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 21) then
            player:tradeComplete();
            player:addItem(11492);
            player:messageSpecial(ITEM_OBTAINED,11492);
            player:addGil(GIL_RATE*423);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*423);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 23) then
            player:tradeComplete();
            player:addItem(17076);
            player:messageSpecial(ITEM_OBTAINED,17076);
            player:addGil(GIL_RATE*50);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
            player:addTitle(CORDON_BLEU_FISHER);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 25) then
            player:tradeComplete();
            player:addItem(1278);
            player:messageSpecial(ITEM_OBTAINED,1278);
            player:addGil(GIL_RATE*550);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*550);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 27) then
            player:tradeComplete();
            player:addItem(1833);
            player:messageSpecial(ITEM_OBTAINED,1833);
            player:addGil(GIL_RATE*96);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*96);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 29) then
            rand = math.random(1,6);
            player:tradeComplete();
            player:addItem(929,rand);
            player:messageSpecial(ITEM_OBTAINED,929,rand);
            player:addGil(GIL_RATE*119);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*119);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 31) then
            player:tradeComplete();
            player:addItem(12317);
            player:messageSpecial(ITEM_OBTAINED,12317);
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 33) then
            player:tradeComplete();
            player:addItem(13456);
            player:messageSpecial(ITEM_OBTAINED,13456);
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 35) then
            player:tradeComplete();
            player:addItem(1837);
            player:messageSpecial(ITEM_OBTAINED,1837);
            player:addGil(GIL_RATE*880);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*880);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 37) then
            player:tradeComplete();
            player:addItem(19186);
            player:messageSpecial(ITEM_OBTAINED,19186);
            player:addGil(GIL_RATE*50);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 39) then
            rand = math.random(1,6);
            player:tradeComplete();
            player:addItem(944,rand);
            player:messageSpecial(ITEM_OBTAINED,944,rand);
            player:addGil(GIL_RATE*50);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 41) then
            player:tradeComplete();
            player:addItem(1832);
            player:messageSpecial(ITEM_OBTAINED,1832);
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 43) then
            player:tradeComplete();
            player:addItem(16184);
            player:messageSpecial(ITEM_OBTAINED,16184);
            player:addGil(GIL_RATE*390);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*390);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 45) then
            player:tradeComplete();
            player:addItem(16606);
            player:messageSpecial(ITEM_OBTAINED,16606);
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 47) then
            player:tradeComplete();
            player:addItem(793);
            player:messageSpecial(ITEM_OBTAINED,793);
            player:addGil(GIL_RATE*51);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*51);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 48) then
            player:tradeComplete();
            player:addItem(792);
            player:messageSpecial(ITEM_OBTAINED,792);
            player:addGil(GIL_RATE*51);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*51);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 50) then
            player:tradeComplete();
            player:addItem(1826);
            player:messageSpecial(ITEM_OBTAINED,1826);
            player:addGil(GIL_RATE*880);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*880);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 52) then
            player:tradeComplete();
            player:addItem(483);
            player:messageSpecial(ITEM_OBTAINED,483);
            player:addGil(GIL_RATE*532);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*532);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 54) then
            rand = math.random(1,6);
            player:tradeComplete();
            player:addItem(943,rand);
            player:messageSpecial(ITEM_OBTAINED,943,rand);
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 56) then
            player:tradeComplete();
            player:addItem(16850);
            player:messageSpecial(ITEM_OBTAINED,16850);
            player:addGil(GIL_RATE*478);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*478);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 58) then
            player:tradeComplete();
            player:addItem(13480);
            player:messageSpecial(ITEM_OBTAINED,13480);
            player:addGil(GIL_RATE*16);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*16);
            player:addTitle(CORDON_BLEU_FISHER);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 60) then
            player:tradeComplete();
            player:addItem(11655);
            player:messageSpecial(ITEM_OBTAINED,11655);
            player:addGil(GIL_RATE*360);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*360);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 62) then
            player:tradeComplete();
            player:addItem(1122);
            player:messageSpecial(ITEM_OBTAINED,1122);
            player:addGil(GIL_RATE*516);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*516);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 63) then
            player:tradeComplete();
            player:addItem(11655);
            player:messageSpecial(ITEM_OBTAINED,2523);
            player:addGil(GIL_RATE*516);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*516);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 65) then
            player:tradeComplete();
            player:addItem(795);
            player:messageSpecial(ITEM_OBTAINED,795);
            player:addGil(GIL_RATE*390);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*390);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 67) then
            player:tradeComplete();
            player:addItem(11624);
            player:messageSpecial(ITEM_OBTAINED,11624);
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 69) then
            player:tradeComplete();
            player:addItem(18377);
            player:messageSpecial(ITEM_OBTAINED,18377);
            player:addGil(GIL_RATE*800);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*800);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 71) then
            player:tradeComplete();
            player:addItem(17006);
            player:messageSpecial(ITEM_OBTAINED,17006);
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 73) then
            player:tradeComplete();
            player:addItem(16837);
            player:messageSpecial(ITEM_OBTAINED,16837);
            player:addGil(GIL_RATE*250);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*250);
            player:addTitle(ACE_ANGLER);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 75) then
            player:tradeComplete();
            player:addItem(942);
            player:messageSpecial(ITEM_OBTAINED,942);
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 77) then
            rand = math.random(1,10);
            player:tradeComplete();
            player:addItem(945,rand);
            player:messageSpecial(ITEM_OBTAINED,945,rand);
            player:addGil(GIL_RATE*250);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*250);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 79) then
            player:tradeComplete();
            player:addItem(19290);
            player:messageSpecial(ITEM_OBTAINED,19290);
            player:addGil(GIL_RATE*810);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*810);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 81) then
            player:tradeComplete();
            player:addItem(16533);
            player:messageSpecial(ITEM_OBTAINED,16533);
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:addTitle(LU_SHANGLIKE_FISHER_KING);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 83) then
            player:tradeComplete();
            player:addItem(645);
            player:messageSpecial(ITEM_OBTAINED,645);
            player:addGil(GIL_RATE*810);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*810);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 85) then
            player:tradeComplete();
            player:addItem(1262);
            player:messageSpecial(ITEM_OBTAINED,1262);
            player:addGil(GIL_RATE*340);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*340);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 86) then
            player:tradeComplete();
            player:addItem(1256);
            player:messageSpecial(ITEM_OBTAINED,1256);
            player:addGil(GIL_RATE*340);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*340);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 87) then
            player:tradeComplete();
            player:addItem(1260);
            player:messageSpecial(ITEM_OBTAINED,1260);
            player:addGil(GIL_RATE*340);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*340);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 89) then
            player:tradeComplete();
            player:addItem(4361);
            player:messageSpecial(ITEM_OBTAINED,4361);
            player:addGil(GIL_RATE*225);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*225);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 90) then
            player:tradeComplete();
            player:addItem(888);
            player:messageSpecial(ITEM_OBTAINED,888);
            player:addGil(GIL_RATE*225);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*225);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 92) then
            player:tradeComplete();
            player:addItem(770);
            player:messageSpecial(ITEM_OBTAINED,770);
            player:addGil(GIL_RATE*15);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*15);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end

        end
--------------------------------------------------------------------------------------------------------------------
------------------------------------- Gil Only ---------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
    elseif (csid == 0x00a7) then
        if (player:getVar("ItB_Var") == 3) then
            player:tradeComplete();
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 5) then
            player:tradeComplete();
            player:addGil(GIL_RATE*475);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*475);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 8) then
            player:tradeComplete();
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 10) then
            player:tradeComplete();
            player:addGil(GIL_RATE*200);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 12) then
            player:tradeComplete();
            player:addGil(GIL_RATE*800);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*800);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 14) then
            player:tradeComplete();
            player:addGil(GIL_RATE*1763);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*1763);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 16) then
            player:tradeComplete();
            player:addGil(GIL_RATE*10);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*10);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 18) then
            player:tradeComplete();
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 20) then
            player:tradeComplete();
            player:addGil(GIL_RATE*250);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*250);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 22) then
            player:tradeComplete();
            player:addGil(GIL_RATE*423);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*423);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 24) then
            player:tradeComplete();
            player:addGil(GIL_RATE*50);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
            player:setVar("ItB_Var",0);
            player:addTitle(CORDON_BLEU_FISHER);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 26) then
            player:tradeComplete();
            player:addGil(GIL_RATE*550);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*550);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 28) then
            player:tradeComplete();
            player:addGil(GIL_RATE*96);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*96);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 30) then
            player:tradeComplete();
            player:addGil(GIL_RATE*119);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*119);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 32) then
            player:tradeComplete();
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 34) then
            player:tradeComplete();
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 36) then
            player:tradeComplete();
            player:addGil(GIL_RATE*880);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*880);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 38) then
            player:tradeComplete();
            player:addGil(GIL_RATE*50);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 40) then
            player:tradeComplete();
            player:addGil(GIL_RATE*50);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 42) then
            player:tradeComplete();
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 44) then
            player:tradeComplete();
            player:addGil(GIL_RATE*390);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*390);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 46) then
            player:tradeComplete();
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 49) then
            player:tradeComplete();
            player:addGil(GIL_RATE*51);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*51);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 51) then
            player:tradeComplete();
            player:addGil(GIL_RATE*880);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*880);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 53) then
            player:tradeComplete();
            player:addGil(GIL_RATE*532);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*532);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 55) then
            player:tradeComplete();
            player:addGil(GIL_RATE*150);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 57) then
            player:tradeComplete();
            player:addGil(GIL_RATE*478);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*478);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 59) then
            player:tradeComplete();
            player:addGil(GIL_RATE*16);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*16);
            player:addTitle(CORDON_BLEU_FISHER);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 61) then
            player:tradeComplete();
            player:addGil(GIL_RATE*360);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*360);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 64) then
            player:tradeComplete();
            player:addGil(GIL_RATE*516);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*516);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 66) then
            player:tradeComplete();
            player:addGil(GIL_RATE*390);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*390);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 68) then
            player:tradeComplete();
            player:addGil(GIL_RATE*300);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 70) then
            player:tradeComplete();
            player:addGil(GIL_RATE*800);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*800);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 72) then
            player:tradeComplete();
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 74) then
            player:tradeComplete();
            player:addGil(GIL_RATE*250);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*250);
            player:addTitle(ACE_ANGLER);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 76) then
            player:tradeComplete();
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 78) then
            player:tradeComplete();
            player:addGil(GIL_RATE*250);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*250);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 80) then
            player:tradeComplete();
            player:addGil(GIL_RATE*810);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*810);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 82) then
            player:tradeComplete();
            player:addGil(GIL_RATE*350);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
            player:addTitle(LU_SHANGLIKE_FISHER_KING);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 84) then
            player:tradeComplete();
            player:addGil(GIL_RATE*810);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*810);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 88) then
            player:tradeComplete();
            player:addGil(GIL_RATE*340);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*340);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 91) then
            player:tradeComplete();
            player:addGil(GIL_RATE*225);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*225);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end
        elseif (player:getVar("ItB_Var") == 93) then
            player:tradeComplete();
            player:addGil(GIL_RATE*15);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*15);
            player:setVar("ItB_Var",0);
            if (player:getQuestStatus(OTHER_AREAS,INSIDE_THE_BELLY) == QUEST_ACCEPTED) then
                player:completeQuest(OTHER_AREAS,INSIDE_THE_BELLY);
            end

        end
    end
end;