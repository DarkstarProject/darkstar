-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Kipopo
-- Type: Leathercraft Synthesis Image Support
-- !pos -191.050 -2.15 12.285 230
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,7);
    local SkillCap = getCraftSkillCap(player, dsp.skill.LEATHERCRAFT);
    local SkillLevel = player:getSkillLevel(dsp.skill.LEATHERCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY) == false) then
            player:startEvent(651,SkillCap,SkillLevel,1,239,player:getGil(),0,0,0);
        else
            player:startEvent(651,SkillCap,SkillLevel,1,239,player:getGil(),7128,0,0);
        end
    else
        player:startEvent(651); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 651 and option == 1) then
        player:messageSpecial(ID.text.LEATHER_SUPPORT,0,5,1);
        player:addStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY,1,0,120);
    end
end;