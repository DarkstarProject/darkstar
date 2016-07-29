-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Greubaque
-- Type: Smithing Adv. Synthesis Image Support
-- @pos -179.400 10.999 150.000 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,8);
    local SkillLevel = player:getSkillLevel(SKILL_SMITHING);
    local Cost = getAdvImageSupportCost(player,SKILL_SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_SMITHING_IMAGERY) == false) then
            player:startEvent(0x0274,Cost,SkillLevel,0,205,player:getGil(),0,0,0);
        else
            player:startEvent(0x0274,Cost,SkillLevel,0,205,player:getGil(),28721,4095,0);
        end
    else
        player:startEvent(0x0274,Cost,SkillLevel,0,201,player:getGil(),0,26,0); -- Standard Dialogue
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
    local Cost = getAdvImageSupportCost(player,SKILL_SMITHING);

    if (csid == 0x0274 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(IMAGE_SUPPORT,0,2,0);
        player:addStatusEffect(EFFECT_SMITHING_IMAGERY,3,0,480);
    end
end;