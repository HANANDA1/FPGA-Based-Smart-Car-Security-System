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

![Overview](https://github.com/user-attachments/assets/816f66b0-ebda-4f4c-8c5c-d8bd88b1f953)

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
![Requirements](https://github.com/user-attachments/assets/05d98c02-13f2-4dd2-b8a9-c99020dce5f6)

---
## How the System Works 
Think of the system like a guard dog that:
o	Sleeps quietly until you leave the house.
o	Starts watching when the house is empty.
o	If someone opens the door, it gives them a few seconds — if they don’t prove they belong, it starts barking (alarm).
o	And secretly, it locks the fuel line so even if the thief stops the barking, the car won’t move.

---

## 🛡️ Major Features

![Features](https://github.com/user-attachments/assets/08a4c65b-4b0b-421e-913d-a95b4a74900d)

---
## 📊 System Diagram

![System Diagram](https://github.com/user-attachments/assets/a9d8ab87-3d3f-4e11-93dd-da52cccc5eb8)

---

## 📊 Block Diagram

![Block Diagram](https://github.com/user-attachments/assets/a5fed45a-767d-456a-9b54-c06c48a949d0)

---

## 🔁 FSM Diagram

![FSM 1](https://github.com/user-attachments/assets/9ef9ec2d-25ab-4e28-b11f-5a8acdf068b6)
![FSM 2](https://github.com/user-attachments/assets/531ca61f-ab6d-437d-88b2-84e6d049efc8)

---

## ⏱️ Timing Parameters

![Timing Parameters](https://github.com/user-attachments/assets/0e84c2cc-1158-4d03-9f83-7284642f4f3a)

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
