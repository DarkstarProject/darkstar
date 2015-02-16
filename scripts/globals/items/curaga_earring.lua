-----------------------------------------
--	ID: 14759
--	Item : Curaga Earring
--  This earring functions in the same way as the spell Curaga.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:curaga();
end;
