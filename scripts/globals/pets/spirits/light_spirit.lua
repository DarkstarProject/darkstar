-----------------------------------
--  PET: Light Spirit
-----------------------------------
require("scripts/globals/pets/spirit")

local this = dsp.pet.spirit.create(dsp.magic.element.LIGHT)

-- Selects a spell to cast based on current party status
this.selectSpell = function(spirit)
    -- Helper function to choose a spell based on what buffs a player lacks
    local checkBuffs = function(spirit, player)
        local level = spirit:getMainLvl()
        if not player:hasStatusEffect(dsp.effect.PROTECT) and level >= 7 then -- protect        
            return level >= 76 and 47 or level >= 63 and 46 or level >= 47 and 45 or level >= 27 and 44 or 43                
        end
        if not player:hasStatusEffect(dsp.effect.SHELL) and level >= 17 then -- shell        
            return level >= 76 and 52 or level >= 68 and 51 or level >= 57 and 50 or level >= 37 and 49 or 48
        end
        if not player:hasStatusEffect(dsp.effect.HASTE) and level >= 40 then -- haste        
            return 57
        end
        if not player:hasStatusEffect(dsp.effect.REGEN) and level >= 21 then -- regen        
            return level >= 86 and 477 or level >= 66 and 111 or level >= 44 and 110 or 108
        end
        return false
    end

    local master = spirit:getMaster()
    local level = spirit:getMainLvl()
    local spell = false

    -- Check party HP first; store members needing cured so we
    -- only step through the list once (for cures, at least)
    local party = master:getParty()
    local members_needing_cure = {}
    for _, member in ipairs(party) do
        if member:getHPP() < 50 then
            table.insert(members_needing_cure, member)
        end
    end

    -- Check for curing master or a group
    if master:getHPP() < 70 then
        if #members_needing_cure > 1 and level > 15 then -- Curaga
            return level >= 91 and 11 or level >= 71 and 10 or level >= 51 and 9 or level >= 31 and 8 or 7, master
        else -- Single-target cure on master
            return level >= 80 and 6 or level >= 61 and 5 or level >= 41 and 4 or level >= 21 and 3 or level >= 11 and 2 or 1, master
        end
    end

    -- Attempt to buff master
    spell = checkBuffs(spirit, master)
    if spell then
        return spell, master
    end

    -- Cure a random party member
    if #members_needing_cure > 1 then -- Master won't be in this list; already accounted for above
        local random_member = members_needing_cure[math.random(1, #members_needing_cure)]
        return level >= 80 and 6 or level >= 61 and 5 or level >= 41 and 4 or level >= 21 and 3 or level >= 11 and 2 or 1, random_member
    end

    -- Pick a non-master player to buff somewhat at random
    for _, member in ipairs(party) do
        if math.random(0, 99) < 50 then
            spell = checkBuffs(spirit, member)
            if spell then
                return spell, member
            end
        end
    end

    -- Small cure on master
    if master:getHPP() < 90 then
        return level >= 30 and 3 or level >= 20 and 2 or 1, master
    end
    
    return spell, master
end

-- Casts a spell if spell-casting is currently allowed
this.castSpell = function(spirit, msSinceLastCast)
    local fastCast  = this.getCastingTime(spirit)   
    if msSinceLastCast > fastCast / 2 then -- light spirit casts twice as frequently            
        spell, target = this.selectSpell(spirit)
        if spell then
            spirit:castSpell(spell, target)
            return true
        end
    end

    return false   
end

return this
