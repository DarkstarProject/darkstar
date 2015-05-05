-------------------------------------------------
--	Author: Setzor : setzor@gmail.com
--	Fishing functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Fishing
--      http://ffxi.somepage.com/guides/fishing-other.php
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/fishing/rods");
require("scripts/globals/fishing/fish");
require("scripts/globals/fishing/monsters");
require("scripts/globals/fishing/items");
require("scripts/globals/fishing/zones");

-- Configuration

--Chance percentages, Chance of catching a fish is 100 minus the following 2 configs

CHANCE_FISH_NONE = 20; -- % chance of getting nothing
CHANCE_FISH_ITEM = 10; -- % chance of fishing item/monster

--[[
 returns
   a: did we catch a fish (0/1)
   b: what did we catch (1-4)
   c: how do we feel about it (1-6)
   d: which item/monster did we catch (item/monsterid)
   e: how big is the fish
   f: how much stamina required
]]

function getFish(zone,skill) 

end;

function onFishingCheck(player,zone,zonetype)
    local Success = 0;
    local Caught = 0;
    local Feeling = 0;
    local Item = 0;
    local Size = 0;
    local Stamina = 0;
    
    local Rod = player:getEquipID(SLOT_RANGED);
    local Bait = player:getEquipID(SLOT_AMMO);

    local Chance = math.random(1,100);
    Chance = 25;
    local Skill = player:getSkillLevel(SKILL_FSH);
    printf("[FISHINGCHECK 1] FISHING ::: Chance: %u, Zone: %u, ZoneType: %u,",Chance,zone,zonetype);
    if (Chance <= CHANCE_FISH_NONE) then    
        printf("[FISHINGCHECK 2] FISHING::: CAUGHT NOTHING");                     
    -- caught nothing (0)
        Success = 0;
        Caught = 0;
        Feeling = 0;
        Item = 0;
        Size = 0;
        Stamina = 0;

    elseif (Chance <= CHANCE_FISH_ITEM + CHANCE_FISH_NONE) then  
        printf("[FISHINGCHECK 3] FISHING::: CAUGHT ITEM OR MONSTER");                     
    -- caught item (3) / monster (4)
        Success = 1;
        if (zonetype == 1) then -- if in city, get item
            printf("[FISHINGCHECK 4] FISHING::: CAUGHT ITEM IN CITY");                     
            Caught = 3; 
            if (#fishingtable[zone][FISHINGTABLE_ITEM] > 0) then
                ItemIndex = math.random(1, #fishingtable[zone][FISHINGTABLE_ITEM]);
                Item = fishingtable[zone][FISHINGTABLE_ITEM][ItemIndex][1];
            else 
                Success = 0;
                Caught = 0;
                Feeling = 0;
                Item = 0;
                Size = 0;
                Stamina = 0;
            end;

        else  -- if in battlefield, get item/monster
            printf("[FISHINGCHECK 5] FISHING::: CAUGHT ITEM/MONSTER OUTSIDE");                     
            if (1 == 1) then
                printf("[FISHINGCHECK 6] FISHING::: CAUGHT MONSTER OUTSIDE");                     
                Caught = 4;
                if (#fishingtable[zone][FISHINGTABLE_MONSTER] > 0) then
                    ItemIndex = math.random(1, #fishingtable[zone][FISHINGTABLE_MONSTER]);
                    Item = fishingtable[zone][FISHINGTABLE_MONSTER][ItemIndex][1];
                else 
                    Success = 0;
                    Caught = 0;
                    Feeling = 0;
                    Item = 0;
                    Size = 0;
                    Stamina = 0;
                end;
            else
                printf("[FISHINGCHECK 6] FISHING::: CAUGHT ITEM OUTSIDE");                     
                Caught = 3; 
                if (#fishingtable[zone][FISHINGTABLE_ITEM] > 0) then
                    ItemIndex = math.random(1, #fishingtable[zone][FISHINGTABLE_ITEM]);
                    Item = fishingtable[zone][FISHINGTABLE_ITEM][ItemIndex][1];
                else 
                    Success = 0;
                    Caught = 0;
                    Feeling = 0;
                    Item = 0;
                    Size = 0;
                    Stamina = 0;
                end;             
            end;
        end;

    else                                                         
        printf("[FISHINGCHECK 7] FISHING::: CAUGHT FISH");                     
    -- caught little fish (1) / big fish (2) - 
        Success = 1;
        Caught = 1;
        if (#fishingtable[zone][FISHINGTABLE_FISH][1][Bait] > 0) then

             printf("[FISHINGCHECK 8] FISHING::: FOUND A FISH!");                     

            ItemIndex = math.random(1, #fishingtable[zone][FISHINGTABLE_FISH][1][Bait]);
            Item = fishingtable[zone][FISHINGTABLE_FISH][1][Bait][ItemIndex][1];
            Feeling = 1;
        else 
            Success = 0;
            Caught = 0;
            Feeling = 0;
            Item = 0;
            Size = 0;
            Stamina = 0;
        end;
    end;
    printf("Success: %u - Caught: %u - Feeling: %u - Item: %u - Size: %u - Stamina: %u",Success,Caught,Feeling,Item,Size,Stamina);
    return Success,Caught,Feeling,Item,Size,Stamina;
end;

function onFishingComplete(player,zonetype,action,stamina,monsterid) 
    local Rod = player:getEquipID(SLOT_RANGED);
    local Bait = player:getEquipID(SLOT_AMMO);
    if (monsterid > 0) then
        local Rotation = player:getRotPos();
        local x = player:getXPos();
        local y = player:getYPos();
        local z = player:getZPos();

        local theta = math.atan2(x,z);

        local Radians = Rotation * math.pi/128;
        local monsterX = x - 2 * math.cos(Radians); 
        local monsterY = y;
        local monsterZ = z + 2 * math.sin(Radians); 
        SpawnMob(monsterid):updateClaim(player);
        GetMobByID(monsterid):setPos(monsterX, monsterY, monsterZ); 
    end;
    printf("ZoneType: %u, Action: %u, Stamina: %u, Rod: %u, Bait: %u, Type: %u, Durability: %u, Broken Id: %u, Monster Id: %u",zonetype,action,stamina,Rod,Bait,rods[Rod][1],rods[Rod][2],rods[Rod][3],monsterid);
    return 100,0;
end;

function onFishingEnd(player) 
    return 200,0;
end;