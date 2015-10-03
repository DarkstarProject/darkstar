===================================================================
--- scripts/globals/items/scroll_of_blizzaja.lua	(revision 0)
+++ scripts/globals/items/scroll_of_blizzaja.lua	(working copy)
@@ -0,0 +1,21 @@
+-----------------------------------------
+--	ID: 4891
+--	Scroll of Blizzaja
+--	Teaches the black magic Blizzaja
+-----------------------------------------
+
+-----------------------------------------
+-- OnItemCheck
+-----------------------------------------
+
+function onItemCheck(target)
+	return target:canLearnSpell(497);
+end;
+
+-----------------------------------------
+-- OnItemUse
+-----------------------------------------
+
+function onItemUse(target)
+	target:addSpell(497);
+end;