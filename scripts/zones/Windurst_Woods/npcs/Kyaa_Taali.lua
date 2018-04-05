-----------------------------------
-- Area: Windurst Woods
--  NPC: Kyaa Taali
-- Type: Bonecraft Image Support
-- !pos -10.470 -6.25 -141.700 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,2);
    local SkillCap = getCraftSkillCap(player,SKILL_BONECRAFT);
    local SkillLevel = player:getSkillLevel(SKILL_BONECRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effects.BONECRAFT_IMAGERY) == false) then
            player:startEvent(10020,SkillCap,SkillLevel,2,509,player:getGil(),0,0,0);
        else
            player:startEvent(10020,SkillCap,SkillLevel,2,511,player:getGil(),7147,0,0);
        end
    else
        player:startEvent(10020); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10020 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,6,2);
        player:addStatusEffect(dsp.effects.BONECRAFT_IMAGERY,1,0,120);
    end
end;