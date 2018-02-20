-----------------------------------
-- Area: Bastok Mines
--  NPC: Sieglinde
-- Alchemy Synthesis Image Support
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,1);
    local SkillCap = getCraftSkillCap(player,SKILL_SMITHING);
    local SkillLevel = player:getSkillLevel(SKILL_SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_ALCHEMY_IMAGERY) == false) then
            player:startEvent(124,SkillCap,SkillLevel,2,201,player:getGil(),0,4095,0);
        else
            player:startEvent(124,SkillCap,SkillLevel,2,201,player:getGil(),7009,4095,0);
        end
    else
        player:startEvent(124);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 124 and option == 1) then
        player:messageSpecial(ALCHEMY_SUPPORT,0,7,2);
        player:addStatusEffect(EFFECT_ALCHEMY_IMAGERY,1,0,120);
    end
end;