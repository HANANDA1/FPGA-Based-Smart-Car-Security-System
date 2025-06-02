# FPGA-Based-Smart-Car-Security-System
![Project Status](https://img.shields.io/badge/status-Completed-brightgreen.svg)
![Platform](https://img.shields.io/badge/platform-FPGA-blue.svg)
![Tool-Vivado](https://img.shields.io/badge/tool-Vivado-ff69b4.svg)
![Tool-Quartus](https://img.shields.io/badge/tool-Quartus-9cf.svg)
![Simulator](https://img.shields.io/badge/simulation-ModelSim-yellow.svg)
![Language-Verilog](https://img.shields.io/badge/language-Verilog-blue.svg)
![Language-SystemVerilog](https://img.shields.io/badge/language-SystemVerilog-purple.svg)
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)
![Design](https://img.shields.io/badge/system-Anti--Theft-red.svg)

A concealed and reprogrammable smart anti-theft system designed using Verilog HDL and system verilog for high-end vehicles such as Porsche. This project enhances security by detecting unauthorized access, activating an audible alarm, and securely disabling the fuel pump unless the correct hidden owner-authenticated sequence is performed.
---

## 📌 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [System Diagram](#system-diagram)
- [FSM Diagram](#fsm-diagram)
- [Timing Parameters](#timing-parameters)
- [Tools and Technologies](#tools-and-technologies)
- [Repository Structure](#repository-structure)
- [Simulation Checklist](#simulation-checklist)
- [Results](#results)
- [Screenshots Placeholders](#screenshots-placeholders)
- [Future Work](#future-work)
- [License](#license)

---

## 🧩 Overview

This Verilog HDL project implements a smart automotive anti-theft system simulating Porsche-style security features. The system:
- Automatically arms itself after the driver exits
- Monitors door sensors
- Starts a countdown when intrusion is detected
- Sounds an alarm if no valid disarm is received
- Blocks the fuel pump unless a secret brake + hidden switch combo is pressed

All inputs are debounced and synchronized. The design is modular, testbench-driven, and verified using ModelSim.

---

## 🛡️ Features

| Feature               | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Auto-Arming**       | Activates automatically when ignition is off and all doors are closed       |
| **Countdown Timer**   | Starts countdown on door opening, awaits ignition input                     |
| **Siren Alarm**       | Loud siren triggered if countdown expires without valid disarm              |
| **Fuel Pump Lock**    | Blocks fuel pump unless correct disarm combo (brake + hidden switch)        |
| **LED Indicator**     | Blinks in Armed mode, stays solid in Triggered and Alarm modes              |
| **Configurable Timers**| Reprogrammable delay values for arm, driver, passenger, and alarm intervals |

---

## 📊 System Diagram

> _Replace the image below with your system block diagram screenshot (e.g., image.png)._

![System Diagram](<path-to-system-diagram>)

---

## 🔁 FSM Diagram

> _Replace the image below with your FSM diagram showing states like Armed, Triggered, Alarm, Disarmed._

![FSM Diagram](<path-to-fsm-diagram>)

---

## ⏱️ Timing Parameters

| Interval              | Symbol           | Default Time (sec) | Binary Value |
|-----------------------|------------------|---------------------|--------------|
| Arming Delay          | `T_ARM_DELAY`    | 6                   | `0110`       |
| Driver Door Countdown | `T_DRIVER_DELAY` | 8                   | `1000`       |
| Passenger Door Delay  | `T_PASSENGER_DELAY` | 15              | `1111`       |
| Siren Alarm Duration  | `T_ALARM_ON`     | 10                  | `1010`       |

These values are stored in memory and can be reprogrammed at runtime.

---

## 🧰 Tools and Technologies

- **HDL**: Verilog & SystemVerilog
- **Simulation**: ModelSim 10.5
- **Waveform Debug**: GTKWave
- **Version Control**: Git
- **Editing**: VS Code / Vim
- **Platform**: Intel/Altera FPGA (Simulated)

---

## 📁 Repository Structure
├── sourcecode/ # Verilog modules (RTL) ├── testbenches/ # SystemVerilog testbenches ├── simulations/ # VCD/FSDB waveform files ├── docs/ # Report, Results, and References ├── README.md # This file ├── Project_Report.pdf ├── Project_Results.docx └── Presentation.pptx


---

## ✅ Simulation Checklist

- [x] **FSM Behavior**: Verified transitions between all states (Armed, Triggered, Alarm, Disarmed)
- [x] **Timer Accuracy**: All time intervals matched expected durations
- [x] **Siren Modulation**: Alternating 440Hz and 880Hz tones confirmed
- [x] **Fuel Pump Lock**: Disarm sequence required to restore pump power
- [x] **LED Indicator**: Correct status signal behavior (blinking, solid, off)
- [x] **Debouncer**: Inputs free from glitches or spurious toggles
- [x] **Time Reprogrammability**: Parameters updated and reflected immediately
- [x] **Testbenches**: Each module tested independently in ModelSim

---

## 📈 Results

Below are key results verified from simulations and waveform analyses:

- ✅ **Auto-Arming Delay**: System enters Armed state exactly **6 seconds** after ignition off and all doors closed.
- ✅ **Driver Door Trigger**: Countdown of **8 seconds** starts upon driver door open. LED solid during countdown.
- ✅ **Siren Behavior**: Siren asserts if countdown expires, alternating tones confirmed via waveform.
- ✅ **Fuel Pump Safety**: Fuel pump remains OFF until **brake + hidden switch** are pressed under ignition.
- ✅ **Parameter Update**: New values loaded during reprogramming reflected instantly in next FSM cycle.
- ✅ **No Metastability**: Debouncer module ensures all transitions are clean and glitch-free.
- ✅ **FSM Coverage**: All FSM transitions including resets, armed/triggered/alarm/disarm verified.

---

## 📸 Screenshots Placeholders

> Replace the links below with actual screenshots once available.

- `fsm_behavior.png` — FSM state transition waveform  
- `fuel_pump_unlock.png` — Verification of disarm sequence  
- `siren_output.png` — Siren modulating signal (440Hz ↔ 880Hz)  
- `time_parameters_config.png` — Reprogrammability test  
- `system_diagram.png` — Top-level system diagram  
- `rtl_view.png` — Quartus RTL viewer snapshot  
- `led_indicator_behavior.png` — LED blinking/solid logic visualization  

---

## 🚀 Future Work

- 🔌 Deploy system on DE1-SoC or DE2-115 FPGA board
- 🛜 Add wireless intrusion notifications (Bluetooth/LoRa)
- 🧠 Integrate more sensors (e.g., trunk, glass-break, shock)
- 🔄 Connect FSM to CAN-bus for full-vehicle monitoring
- 🔒 Implement anti-tamper logic and encrypted configuration

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

> 📌 _Developed as part of FPGA Digital Design coursework — includes RTL coding, simulation, and system-level integration._
