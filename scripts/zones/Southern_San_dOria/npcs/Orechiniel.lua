-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Orechiniel
-- Type: Leathercraft Adv. Synthesis Image Support
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,7);
    local SkillLevel = player:getSkillLevel(dsp.skill.LEATHERCRAFT);
    local Cost = getAdvImageSupportCost(player, dsp.skill.LEATHERCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY) == false) then
            player:startEvent(650,Cost,SkillLevel,0,239,player:getGil(),0,0,0);
        else
            player:startEvent(650,Cost,SkillLevel,0,239,player:getGil(),28727,0,0);
        end
    else
        player:startEvent(650); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    local Cost = getAdvImageSupportCost(player, dsp.skill.LEATHERCRAFT);

    if (csid == 650 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(ID.text.LEATHER_SUPPORT,0,5,0);
        player:addStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY,3,0,480);
    end
end;