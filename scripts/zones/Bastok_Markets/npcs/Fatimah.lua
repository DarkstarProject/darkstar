-----------------------------------
-- Area: Bastok Markets
--  NPC: Fatimah
-- Type: Goldsmithing Adv. Synthesis Image Support
-- @pos -193.849 -7.824 -56.372 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,6);
    local SkillLevel = player:getSkillLevel(SKILL_GOLDSMITHING);
    local Cost = getAdvImageSupportCost(player, SKILL_GOLDSMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_GOLDSMITHING_IMAGERY) == false) then
            player:startEvent(0x012E,Cost,SkillLevel,0,0xB0001AF,player:getGil(),0,0,0); -- Event doesn't work
        else
            player:startEvent(0x012E,Cost,SkillLevel,0,0xB0001AF,player:getGil(),28674,0,0);
        end
    else
        player:startEvent(0x012E);
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
    local Cost = getAdvImageSupportCost(player, SKILL_GOLDSMITHING);

    if (csid == 0x012E and option == 1) then
        if (player:getGil() >= Cost) then
            player:messageSpecial(GOLDSMITHING_SUPPORT,0,3,0);
            player:addStatusEffect(EFFECT_GOLDSMITHING_IMAGERY,3,0,480);
            player:delGil(Cost);
        else
            player:messageSpecial(NOT_HAVE_ENOUGH_GIL);
        end
    end
end;