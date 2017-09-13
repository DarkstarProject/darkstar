++-----------------------------------------
+-- Spell: Fire VI
+-- Deals fire damage to an enemy.
+-----------------------------------------
+
+require("scripts/globals/magic");
+require("scripts/globals/status");
+
+-----------------------------------------
+-- OnSpellCast
+-----------------------------------------
+
+function onMagicCastingCheck(caster, target, spell)
+    return 0;
+end;
+
+function onSpellCast(caster, target, spell)
+    local spellParams = {};
+    spellParams.hasMultipleTargetReduction = false;
+    spellParams.resistBonus = 1.0;
     spellParams.V0 = 920;
+    spellParams.V50 = 1208;
+    spellParams.V100 = 1469;
+    spellParams.V200 = 1946;
+    spellParams.M0 = 5.76;
+    spellParams.M50 = 5.21;
+    spellParams.M100 = 4.77;
+    spellParams.M200 = 4;

+    return doElementalNuke(caster, spell, target, spellParams);
+end;
