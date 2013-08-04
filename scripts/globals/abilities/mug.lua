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

    if(target:isMob() and math.random(100) < mugChance and target:getMobMod(MOBMOD_MUG_GIL) > 0) then
    	gil = target:getGil();

        if(target:getMobMod(MOBMOD_MUG_GIL)) then
            local range = target:getMobMod(MOBMOD_MUG_GIL);
            -- remove 1-10% of total
            gil = range - (range * (math.random(1,10) / 100));
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