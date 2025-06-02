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

---
A concealed and reprogrammable smart anti-theft system designed using Verilog HDL and system verilog for high-end vehicles such as Porsche. This project enhances security by detecting unauthorized access, activating an audible alarm, and securely disabling the fuel pump unless the correct hidden owner-authenticated sequence is performed.


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

Imagine someone buys a fancy new car, like a Porsche. It already has a built-in anti-theft system, but the owner is still worried that thieves might know how to disable it. So, our job was to design a smarter, hidden anti-theft system that’s harder to bypass — something only the owner knows how to deactivate. So, we need a system that:
o	Automatically turns on after the driver leaves the car.
o	Detects if someone opens the car door.
o	Gives the real owner some time to start the car before sounding an alarm.
o	Triggers a loud siren if the car is being accessed wrongly.
o	Blocks the fuel pump secretly, so even if someone disables the siren, they can't drive away.

## How the System Works 
Think of the system like a guard dog that:
o	Sleeps quietly until you leave the house.
o	Starts watching when the house is empty.
o	If someone opens the door, it gives them a few seconds — if they don’t prove they belong, it starts barking (alarm).
o	And secretly, it locks the fuel line so even if the thief stops the barking, the car won’t move.


---

## 🛡️ Major Features

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

![System Diagram](https://github.com/user-attachments/assets/a5fed45a-767d-456a-9b54-c06c48a949d0)

---

## 📊 Block Diagram

![Block Diagram](https://github.com/user-attachments/assets/a9d8ab87-3d3f-4e11-93dd-da52cccc5eb8)

---

## 🔁 FSM Diagram


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
