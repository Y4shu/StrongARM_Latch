# StrongARM latch recreation and comparison

This project has two stages. First I recreated the **13-transistor Design 3 in Figure 4 of Bandla and Pal** [FURTHER REFERRED TO AS "FIGURE 4"], checked its clocked operation using teaching models, and adapted it to the supplied nominal 65 nm model. Then I tested that modified latch against a **separate 11-transistor conventional latch based on Razavi’s Figure 1(b)** under matched conditions in both HSPICE and LTspice.

Figure 4 correctly resolves both input polarities. In the matched HSPICE test it reduced the Vin+ kickback peak from 54.87 to 22.31 mV and output overshoot from 73.45 to 45.19 mV. The Razavi reference reset faster and had lower ramp-test PDP. See **[measurements and waveforms](docs/RESULTS.md)** for the test definitions and evidence.

## Where to start

| Folder | Purpose | First file to open |
|---|---|---|
| [`replication/teaching/`](replication/teaching/) | Original Figure 4 topology check using generic teaching models at 1.8 V. | [`StrongARM_Fig4_teaching.asc`](replication/teaching/StrongARM_Fig4_teaching.asc) |
| [`replication/`](replication/) | Standalone Figure 4 schematic and HSPICE experiments, including the sizing sweep. | [`StrongARM65.asc`](replication/StrongARM65.asc) or [`01_functional.sp`](replication/01_functional.sp) |
| [`comparison/ltspice/`](comparison/ltspice/) | Both latches in each LTspice deck. | [`01_functional.cir`](comparison/ltspice/01_functional.cir) |
| [`comparison/hspice/`](comparison/hspice/) | Both latches in each HSPICE deck. | [`01_functional.sp`](comparison/hspice/01_functional.sp) |
| [`docs/`](docs/) | Results, measurement methods and selected waveforms. | [`RESULTS.md`](docs/RESULTS.md) |

## Set up the 65 nm model

The 65 nm simulations use the project-supplied nominal BSIM4 model card called **`65nm.pm`**. This repository leaves the model card out. Use the copy supplied by your lab or another source authorized to provide the same model. A different 65 nm model may run with compatible device names, but it does not reproduce the reported values.

Make one copy in each folder whose experiments you want to run:

| For | Exact destination, relative to the repo root |
|---|---|
| Standalone LTspice schematic and HSPICE decks | `replication/65nm.pm` |
| LTspice comparison | `comparison/ltspice/65nm.pm` |
| HSPICE comparison | `comparison/hspice/65nm.pm` |

The decks look for the filename through a relative `.include`; keep the accompanying `.inc` files in the same folder. On Linux, capitalization matters. On Windows, check that the file did not become `65nm.pm.txt`. The model definitions are expected to be named `nmos` and `pmos`. If a simulator reports a missing include, check the exact filename and directory first. Git ignores the local card and generated simulator files.

If you don’t have the project model, the **teaching schematic still runs** using the generic model statements inside the drawing. Its readings are illustrative only.

## Run in LTspice

1. **Standalone recreation:** Open `replication/StrongARM65.asc` from File → Open. After adding the model as above, click Run and plot `V(clk)`, `V(vinp)`, `V(vrefp)`, `V(outp)` and `V(outn)`. Both outputs should be high during reset. During evaluation, the branch that goes low switches when Vin+ moves across the reference. The drawing’s sizing uses the earlier Case 0 baseline, with 180 nm drawn lengths on the 65 nm model; it is separate from the matched Case 2 decks.
2. **Matched comparison:** Open `comparison/ltspice/01_functional.cir` directly. Switch the file-picker filter to **All files** if it shows only schematics. Run it, then plot `V(clk)`, `V(vinp)`, `V(vref)`, `V(f_p)`, `V(f_n)`, `V(s_p)` and `V(s_n)`. Here `f_` identifies Figure 4 and `s_` identifies the conventional reference. Read numerical measurements in the SPICE log.
3. **Kickback overlay:** Run `05_kickback_plus.cir`, put `V(finp,vinp)` and `V(sinp,vinp)` on the same pane, and zoom to **11.98–12.20 ns**. Plot the clock in a separate pane if desired. For the opposite input, run `06_kickback_minus.cir` and use `V(finn,vinn)` and `V(sinn,vinn)`.

## Run in HSPICE

Open a shell where HSPICE is licensed and available. If your lab provides HSPICE on a server, upload the extracted folder and your authorized model copy to that server, then run from the corresponding folder there.

**Figure 4 recreation only**, from the repository root:

```sh
cd replication
mkdir -p results
hspice -i 01_functional.sp -o results/01_functional
```

**Both latches in the same run**, from the repository root:

```sh
cd comparison/hspice
mkdir -p results
hspice -i 01_functional.sp -o results/01_functional
hspice -i 05_kickback_plus.sp -o results/05_kickback_plus
```

Read the `.lis` files for measurements. If your installation produces `.tr0` files, open them in an HSPICE-compatible waveform viewer. The comparison folder also provides `sh run_nominal.sh` for tests 02–07. Use `replication/07_sizing.sp` for the ten-case standalone sweep; the comparison decks already use the selected Case 2 dimensions (65 nm channel lengths).

## Scope and references

The results compare two topologies under the same nominal 65 nm settings. The paper’s own reported simulation used UMC 180 nm at 1.8 V. The project reproduces the circuit topology and illustrates its behavior under the available model; the reported 180 nm numbers are literature benchmarks.

- K. Bandla and D. Pal, [*Strong-ARM Dynamic Latch Comparators: Design and Analyses on CAD Platform*](https://doi.org/10.14445/23488549/IJECE-V1113P109), 2024, Figure 4; waveform in Figure 7.
- B. Razavi, [*The StrongARM Latch*](https://doi.org/10.1109/MSSC.2015.2418155), 2015, Figure 1(b).
