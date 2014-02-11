---------------------------------------------------------------------------------------------------
-- func: SetSkill
-- auth: EDGECOM
-- desc: Sets a specific skill.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, skill, value)
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
        ["singing"]     = 40,
        ["string"]      = 41,
        ["wind"]        = 42,
        ["blue"]        = 43,
        ["geomancy"]    = 44
    };

    local skillId = skillList[ string.lower( skill ) ];

    if (skillId == nil) then
        player:PrintToPlayer( string.format( "Invalid skill name '%s'", skill ) );
        return;
    end
	if (skillId > 0 and value > 500) then
	    -- I am pretty sure the max skill for any weapon is 424 
		-- I am going to allow 500 value not pass max in db
        player:PrintToPlayer( string.format( "value can not exceed 500") );
        return;
    end
	if (skillId > 47) then
        player:PrintToPlayer( string.format( "Please enter a valid combat or magic skill") );
        return;
    end
	if (skillId > 0 and value >= 0) then
        player:SetSkill( skillId  , value);
        player:PrintToPlayer( string.format( "Skill %s is now %s", skill ,value ) );
        return;
     end
end