===================================================================
--- scripts/globals/items/scroll_of_thundaja.lua	(revision 0)
+++ scripts/globals/items/scroll_of_thundaja.lua	(working copy)
@@ -0,0 +1,21 @@
+-----------------------------------------
+--	ID: 4894
+--	Scroll of Thundaja
+--	Teaches the black magic Thundaja
+-----------------------------------------
+
+-----------------------------------------
+-- OnItemCheck
+-----------------------------------------
+
+function onItemCheck(target)
+	return target:canLearnSpell(500);
+end;
+
+-----------------------------------------
+-- OnItemUse
+-----------------------------------------
+
+function onItemUse(target)
+	target:addSpell(500);
+end;