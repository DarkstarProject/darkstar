---------------------------------------------------------------------------------------------------
-- func: @addspell <spellID> <player>
-- desc: adds the ability to use a spell to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, spellId, target)
    if (spellId == nil) then
        player:PrintToPlayer( "You must enter a valid spell ID." );
        player:PrintToPlayer( "@addSpell <spellID> <player>" );
        return;
    end

    if (target == nil) then
        player:addSpell(spellId);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:addSpell(spellId);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@addSpell <spellID> <player>" );
        end
    end
end;