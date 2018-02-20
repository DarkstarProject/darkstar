-----------------------------------
-- Area: Metalworks
--  NPC: Romero
-- Type: Smithing Synthesis Image Support
-- !pos -106.336 2.000 26.117 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,8);
    local SkillCap = getCraftSkillCap(player,SKILL_SMITHING);
    local SkillLevel = player:getSkillLevel(SKILL_SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_SMITHING_IMAGERY) == false) then
            player:startEvent(105,SkillCap,SkillLevel,2,207,player:getGil(),0,0,0);
        else
            player:startEvent(105,SkillCap,SkillLevel,2,207,player:getGil(),7127,0,0);
        end
    else
        player:startEvent(105); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 105 and option == 1) then
        player:messageSpecial(SMITHING_SUPPORT,0,2,2);
        player:addStatusEffect(EFFECT_SMITHING_IMAGERY,1,0,120);
    end
end;