---------------------------------------------------------------------------------------------------
-- func: addspell
-- auth: Wolke
-- desc: Adds the spell to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, spellId)
    if (spellId == nil) then
        player:PrintToPlayer( "You must enter a valid spell id." );
        return;
    end

    player:addSpell( spellId );
end