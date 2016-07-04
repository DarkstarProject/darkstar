-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Orechiniel
-- Type: Leathercraft Adv. Synthesis Image Support
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,7);
    local SkillLevel = player:getSkillLevel(SKILL_LEATHERCRAFT);
    local Cost = getAdvImageSupportCost(player, SKILL_LEATHERCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY) == false) then
            player:startEvent(0x028A,Cost,SkillLevel,0,239,player:getGil(),0,0,0);
        else
            player:startEvent(0x028A,Cost,SkillLevel,0,239,player:getGil(),28727,0,0);
        end
    else
        player:startEvent(0x028A); -- Standard Dialogue
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
    local Cost = getAdvImageSupportCost(player, SKILL_LEATHERCRAFT);

    if (csid == 0x028A and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(LEATHER_SUPPORT,0,5,0);
        player:addStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY,3,0,480);
    end
end;