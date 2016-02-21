---------------------------------------------------------------------------------------------------
-- func: capskill
-- desc: Caps a specific skill.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, skill)
    local skillList =
    {
        -- Combat Skills
        ["h2h"]         = 1,
        ["dagger"]      = 2,
        ["sword"]       = 3,
        ["gsword"]      = 4,
        ["axe"]         = 5,
        ["gaxe"]        = 6,
        ["scythe"]      = 7,
        ["polearm"]     = 8,
        ["katana"]      = 9,
        ["gkatana"]     = 10,
        ["club"]        = 11,
        ["staff"]       = 12,
        ["archery"]     = 25,
        ["marksmanship"]= 26,
        ["throwing"]    = 27,
        ["guard"]       = 28,
        ["evasion"]     = 29,
        ["shield"]      = 30,
        ["parry"]       = 31,

        -- Magic Skills
        ["divine"]      = 32,
        ["healing"]     = 33,
        ["enhancing"]   = 34,
        ["enfeebling"]  = 35,
        ["elemental"]   = 36,
        ["dark"]        = 37,
        ["summoning"]   = 38,
        ["ninjitsu"]    = 39,
        -- Everyone spells it wrong. NinjUtsu is correct!
        ["ninjutsu"]    = 39,
        ["singing"]     = 40,
        ["string"]      = 41,
        ["wind"]        = 42,
        ["blue"]        = 43,
        ["bluemagic"]   = 43,
        ["geomancy"]    = 44
    };

    if (skill == nil) then
        player:PrintToPlayer( "You must enter a valid skill name." );
        return;
    end
    
    if (tonumber(skill) ~= 0 and tonumber(skill) ~= nil) then
        local skillId = tonumber(skill);
        player:capSkill( skillId );
        
        for k, v in pairs(skillList) do
            if (v == skillId) then
                player:PrintToPlayer( string.format( "Capped skill '%s'.", k ) );
                return;
            end
        end
    end
    
    local skillId = skillList[ string.lower( skill ) ];
    if (skillId == nil) then
        player:PrintToPlayer( string.format( "Invalid skill '%s' given.", skill ) );
    else
        player:capSkill( skillId );
        player:PrintToPlayer( string.format( "Capped skill '%s'.", skill ) );
    end
end
    --[[
    if (skill == nil) then
        player:PrintToPlayer( "You must enter a valid skill name." );
        return;
    end
    
    local skillId = skillList[ string.lower( skill ) ];
    if (tonumber(skill) ~= 0) then
        skillId = tonumber(skill);
        player:capSkill( skillId );
        
        for k, v in pairs(skillList) do
            if (v == skillId) then
                player:PrintToPlayer( string.format( "Capped skill '%s'.", k ) );
                return;
            end
        end
    else
        skillId = skillList[ string.lower( skill ) ];
        if (skillId == nil) then
            player:PrintToPlayer( string.format( "Invalid skill '%s' given.", skill ) );
            return;
        end
    end
end
]]