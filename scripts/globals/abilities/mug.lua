-----------------------------------
-- Ability: Mug
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
    local thfLevel;
    local gil = 0;

    if(player:getMainJob() == JOB_THF) then
        thfLevel = player:getMainLvl();
    else
        thfLevel = player:getSubLvl();
    end

    local mugChance = 90 + thfLevel - target:getMainLvl();

    if(target:isMob() and math.random(100) < mugChance and target:getMobMod(MOBMOD_MUG_GIL) > -1) then
    	gil = target:getGil();

        -- is notorious
        -- all notorious monsters can be mugged
        if(target:isMobType(2) and gil <= 0) then
            gil = target:getMainLvl() * 20;
        end

        if(gil <= 0) then
            ability:setMsg(244);
        else
            if(player:getEquipID(SLOT_HEAD) == 15077) then
                gil = gil * 2;
            end

            player:addGil(gil);

            ability:setMsg(129);
        end
    else
        ability:setMsg(244);
    end

    return gil;
end;