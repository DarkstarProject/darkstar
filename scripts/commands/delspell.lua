---------------------------------------------------------------------------------------------------
-- func: @delspell <spellID> <player>
-- desc: Removes a spell from the players spell list.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, spellId, target)
    if (spellId == nil) then
        player:PrintToPlayer( "You must enter a valid spellID." );
        player:PrintToPlayer( "@delspell <spellID> <player>" );
        return;
    end

    if (target == nil) then
        player:delSpell(spellId);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:delSpell(spellId);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@delspell <spellID> <player>" );
        end
    end
end;