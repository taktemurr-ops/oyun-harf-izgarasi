import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_harf_izgarasi/oyun_harf_izgarasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(harfIzgarasiConfig.title.length, 33);
    expect(harfIzgarasiConfig.tagline.length, 33);
    for (final s in harfIzgarasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(harfIzgarasiConfig.gameId, harfIzgarasiId);
    expect(harfIzgarasiRules.gameId, harfIzgarasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(harfIzgarasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: harfIzgarasiId, optionalMechanics: harfIzgarasiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      harfIzgarasiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(harfIzgarasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
