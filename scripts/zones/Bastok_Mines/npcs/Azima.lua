-----------------------------------
-- Area: Bastok Mines
--  NPC: Azima
-- Alchemy Adv. Synthesis Image Support
-- !pos 123.5 2 1 234
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
    local SkillLevel = player:getSkillLevel(SKILL_ALCHEMY);
    local Cost = getAdvImageSupportCost(player,SKILL_ALCHEMY);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effects.ALCHEMY_IMAGERY) == false) then
            player:startEvent(122,Cost,SkillLevel,0,0xB0001AF,player:getGil(),0,0,0); -- Event doesn't work
        else
            player:startEvent(122,Cost,SkillLevel,0,0xB0001AF,player:getGil(),0x6FE2,0,0);
        end
    else
        player:startEvent(122);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local Cost = getAdvImageSupportCost(player,SKILL_ALCHEMY);

    if (csid == 122 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(ALCHEMY_SUPPORT,0,7,0);
        player:addStatusEffect(dsp.effects.ALCHEMY_IMAGERY,3,0,480);
    end
end;