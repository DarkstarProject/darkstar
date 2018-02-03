-----------------------------------
-- Area: Windurst Woods
--  NPC: Lih Pituu
-- Type: Bonecraft Adv. Image Support
-- !pos -5.471 -6.25 -141.211 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/status");
require("scripts/globals/crafting");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,2);
    local SkillLevel = player:getSkillLevel(SKILL_BONECRAFT);
    local Cost = getAdvImageSupportCost(player,SKILL_BONECRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_BONECRAFT_IMAGERY) == false) then
            player:startEvent(10018,Cost,SkillLevel,0,511,player:getGil(),0,7028,0);
        else
            player:startEvent(10018,Cost,SkillLevel,0,511,player:getGil(),28753,3967,0);
        end
    else
        player:startEvent(10018); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local Cost = getAdvImageSupportCost(player,4);

    if (csid == 10018 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(IMAGE_SUPPORT,0,6,0);
        player:addStatusEffect(EFFECT_BONECRAFT_IMAGERY,3,0,480);
    end
end;