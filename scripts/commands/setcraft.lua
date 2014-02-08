---------------------------------------------------------------------------------------------------
-- func: SetSkill
-- auth: EDGECOM
-- desc: Sets a specific skill.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sii"
};

function onTrigger(player, craft, value, rank)
    local CraftList =
    {
        -- crafting Skills
        ["fishing"]      = 48,
        ["woodworking"]  = 49,
        ["smithing"]     = 50,
        ["goldsmithing"] = 51,
        ["clothcraft"]   = 52,
        ["leathercraft"] = 53,
        ["bonecraft"]    = 54,
        ["alchemy"]      = 55,
        ["cooking"]      = 56,
        ["synergy"]      = 57
    };

    local craftId = CraftList[ string.lower( craft ) ];
	
    if (craftId == nil) then
        player:PrintToPlayer( string.format( "Invalid craft name '%s'", craft ) );
        return;
    end
	if (craftId > 0 and value > 100) then
	    -- I am pretty sure the max skill for any weapon is 424 
		-- I am going to allow 500 value not pass max in db
        player:PrintToPlayer( string.format( "value can not exceed 100") );
        return;
    end
	
	if (craftId < 48) then
		player:PrintToPlayer( string.format( "Please Enter a valid craft") );
        return;
	end
	if (craftId > 0 and value >= 0 and rank == 0) then
        player:SetCraft( craftId  , value , rank);
        player:PrintToPlayer( string.format( "'%s' reaches '%s'", craft ,value) );
        return;
     end
    if (craftId > 0 and value >= 0 and rank == 1) then
        player:SetCraft( craftId  , value, rank);
        player:PrintToPlayer( string.format( "'%s' reaches '%s' rank updated", craft ,value) );
        return;
     end
end