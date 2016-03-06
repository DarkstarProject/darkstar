-----------------------------------
--
--
--
-----------------------------------

local stats_bits = {MOD_STR, MOD_DEX, MOD_VIT, MOD_AGI, MOD_INT, MOD_MND, MOD_CHR, MOD_HPP, MOD_MPP}
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
    for statbit,mod in ipairs(stats_bits) do
        if bit.band(bit.lshift(1, statbit - 1), power) > 0 then
            if mod == MOD_HPP or mod == MOD_MPP then
                target:addMod(mod, -40)
            else
                target:addMod(mod, -30)
            end
        end
    end
    target:setStatDebilitation(power)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local power = effect:getPower();
    for statbit,mod in ipairs(stats_bits) do
        if bit.band(bit.lshift(1, statbit - 1), power) > 0 then
            if mod == MOD_HPP or mod == MOD_MPP then
                target:delMod(mod, -40)
            else
                target:delMod(mod, -30)
            end
        end
    end
    target:setStatDebilitation(0)
end;
