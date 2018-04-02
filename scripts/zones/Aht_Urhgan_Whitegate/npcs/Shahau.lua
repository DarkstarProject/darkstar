-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Shahau
-- Type: Alchemy Image Support
-- !pos -10.470 -6.25 -141.700 241
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,1);
    local SkillLevel = player:getSkillLevel(SKILL_ALCHEMY);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effects.ALCHEMY_IMAGERY) == false) then
            player:startEvent(638,4,SkillLevel,2,511,0,0,7,2184);
        else
            player:startEvent(638,4,SkillLevel,2,511,5662,7154,7,2184);
        end
    else
        player:startEvent(638,0,0,0,0,0,0,7,0); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 638 and option == 1) then
        player:messageSpecial(ALCHEMY_SUPPORT,0,7,2);
        player:addStatusEffect(dsp.effects.ALCHEMY_IMAGERY,1,0,120);
    end
end;