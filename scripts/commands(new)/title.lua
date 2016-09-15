---------------------------------------------------------------------------------------------------
-- func: title
-- desc: Sets a players title.
---------------------------------------------------------------------------------------------------

require("scripts/globals/titles");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, titleId, target)
    
    titleId = tonumber(titleId) or _G[titleId];
    
    if (titleId == nil) then
        player:PrintToPlayer("You must enter a valid title id.");
        return
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        targ:addTitle( titleId );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end