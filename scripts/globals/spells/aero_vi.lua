++-----------------------------------------
+-- Spell: Aero VI
+-- Deals wind damage to an enemy.
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
     spellParams.V0 = 862;
+    spellParams.V50 = 1169;
+    spellParams.V100 = 1443;
+    spellParams.V200 = 1870;
+    spellParams.M0 = 6.1;
+    spellParams.M50 = 5.5;
+    spellParams.M100 = 4.85;
+    spellParams.M200 = 4;

+    return doElementalNuke(caster, spell, target, spellParams);
+end;
