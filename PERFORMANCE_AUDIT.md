# SwiftUI Performance Audit (Starter)

## Code-level checks

1. `ForEach` identity is stable (`TaskItem.id`) and never index-based.
2. Filtering is done in model state, not repeatedly in row subviews.
3. No network or heavy work in `body`; async work should live in `.task` or services.
4. Observation scope is narrow (`@State` owner + explicit injection), avoiding broad global invalidation.
5. View tree is stable (no root-level branch swapping between unrelated trees).

## Profiling checklist (Xcode Instruments)

1. Build `Release` and run on a physical device when possible.
2. Record "SwiftUI" + "Time Profiler" while reproducing:
   - list scroll
   - search typing
   - toggle completion rapidly
3. Compare before/after for:
   - dropped frames
   - main-thread time
   - CPU spikes

If runtime symptoms remain after code-level cleanup, capture timeline screenshots and call trees to isolate the hot path.
