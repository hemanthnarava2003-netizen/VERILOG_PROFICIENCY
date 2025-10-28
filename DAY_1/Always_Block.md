# 🔁 Types of `always` Blocks in Verilog

In **Verilog HDL**, the `always` block is used to describe hardware behavior that executes repeatedly in response to changes in signals or clock edges.  
Depending on the sensitivity list and usage, `always` blocks are classified into three main types:

1. 🧮 **Combinational always block**
2. ⏱️ **Sequential (clocked) always block**
3. ⚙️ **Latch (level-sensitive) always block**

---

## 🧩 Overview

| Type | Sensitivity List | Trigger Type | Assignment Operator | Storage Element | Common Use | Description |
|------|------------------|---------------|----------------------|------------------|-------------|--------------|
| 🧮 **Combinational** | `@(*)` | Whenever any input changes | `=` (blocking) | None | Logic gates, multiplexers, ALUs | Models *pure combinational logic* where outputs depend only on current inputs. |
| ⏱️ **Sequential (Clocked)** | `@(posedge clk)` or `@(negedge clk)` | On clock edge | `<=` (non-blocking) | Flip-flop | Registers, counters, FSMs | Models *edge-triggered sequential logic* where outputs depend on inputs and clock. |
| ⚙️ **Latch (Level-Sensitive)** | `(enable or data)` | Whenever enable or data changes | `=` (blocking) | Latch | Enable-controlled storage | Models *level-sensitive storage* that holds data when enable is inactive. |

---

## 🧮 1️⃣ Combinational Always Block

### 🧠 **Concept**
- Represents **pure combinational logic**.  
- Output changes immediately whenever any of the input signals change.  
- Does **not** store any value; no flip-flops or latches are inferred.

### ⚙️ **Sensitivity List**
- Uses `always @(*)`, meaning it automatically reacts to any signal used inside the block.  
- Older Verilog versions required manually listing all signals.

### 🧰 **Characteristics**
| Property | Description |
|-----------|-------------|
| Trigger Event | Any change in input signals |
| Assignment | **Blocking (`=`)** |
| Storage Element | None |
| Hardware Realization | Combinational logic gates |
| Synthesis Behavior | Output updates immediately with input change |

### 📘 **Applications**
- Arithmetic and logic units (ALUs)  
- Multiplexers and demultiplexers  
- Decoders and encoders  
- Combinational data paths  

---

## ⏱️ 2️⃣ Sequential (Clocked) Always Block

### 🧠 **Concept**
- Represents **edge-triggered sequential logic**.  
- Output updates **only on clock edges** (positive or negative).  
- Models **flip-flops** and **registers** that store data across clock cycles.

### ⚙️ **Sensitivity List**
- Uses a **clock edge** (and optionally reset) in sensitivity:  
  - `@(posedge clk)` → Trigger on rising edge  
  - `@(negedge clk)` → Trigger on falling edge  
  - `@(posedge clk or posedge reset)` → Include asynchronous reset  

### 🧰 **Characteristics**
| Property | Description |
|-----------|-------------|
| Trigger Event | Clock edge (rising/falling) |
| Assignment | **Non-blocking (`<=`)** |
| Storage Element | Flip-flop or register |
| Hardware Realization | Sequential elements (D flip-flops) |
| Synthesis Behavior | Value stored until next clock edge |

### 📘 **Applications**
- Counters and shift registers  
- State machines (FSMs)  
- Data registers and pipelines  
- Synchronous systems with clock control  

---

## ⚙️ 3️⃣ Latch (Level-Sensitive) Always Block

### 🧠 **Concept**
- Represents **level-sensitive storage** — output follows the input when enable is active, and holds the last value when enable is inactive.  
- Commonly referred to as a **D-latch**.

### ⚙️ **Sensitivity List**
- Typically written as `always @(enable or data)` or `always @(*)` (with conditions inside).  
- Triggers whenever **enable** or **data** signals change.

### 🧰 **Characteristics**
| Property | Description |
|-----------|-------------|
| Trigger Event | Level change of enable or data |
| Assignment | **Blocking (`=`)** |
| Storage Element | Latch |
| Hardware Realization | Level-sensitive latch |
| Synthesis Behavior | Output transparent when enable is high, holds value when low |

### 📘 **Applications**
- Low-power circuits needing enable-based storage  
- Asynchronous interfaces  
- Gated storage or temporary data holding  
- Rarely used in synchronous designs due to timing issues  

---

## 🧠 Summary Table

| Feature | **Combinational** | **Sequential (Clocked)** | **Latch (Level-Sensitive)** |
|----------|------------------|---------------------------|------------------------------|
| **Sensitivity List** | `@(*)` | `@(posedge clk)` or `@(negedge clk)` | `(enable or data)` |
| **Triggered By** | Any input change | Clock edge | Enable or data change |
| **Assignment Type** | Blocking (`=`) | Non-blocking (`<=`) | Blocking (`=`) |
| **Storage Element** | None | Flip-flop | Latch |
| **Reset Type** | Not applicable | Sync/Async reset | None |
| **Output Behavior** | Immediate | On clock edge | Transparent when enabled |
| **Hardware Type** | Combinational | Sequential | Level-sensitive |
| **Common Uses** | ALUs, MUX, logic blocks | Registers, FSMs | Gated storage |
| **Preferred Practice** | Use `@(*)` | Use clocked edge | Avoid unless required |

---


