import numpy as np
import matplotlib.pyplot as plt

# Function to generate the power signal
def generate_power_signal(f0, fs, duration, snr_db):
    w0 = 2 * np.pi * f0
    t = np.linspace(0, duration, int(fs * duration), endpoint=False)
    
    # Signal components
    v_t = (0.3 +
           5 * np.sin(w0 * t + 2.5) +
           1.5 * np.sin(3 * w0 * t + 1.3) +
           0.75 * np.sin(5 * w0 * t + 1.0) +
           0.375 * np.sin(7 * w0 * t + 0.6) +
           0.1875 * np.sin(9 * w0 * t + 0.3))
    
    # Calculate signal power and noise power
    signal_power = np.mean(v_t ** 2)
    snr_linear = 10 ** (snr_db / 10)
    noise_power = signal_power / snr_linear
    
    # Add noise to the signal
    noise = np.sqrt(noise_power) * np.random.normal(size=v_t.shape)
    noisy_signal = v_t + noise
    
    return t, noisy_signal

# Function to quantize the signal
def quantize_signal(signal, n_bits):
    max_val = 2 ** n_bits - 1
    quantized_signal = np.round((signal - np.min(signal)) / (np.max(signal) - np.min(signal)) * max_val)
    return quantized_signal.astype(np.uint16)

# Function to write the signal to a .mif file
def write_mif_file(filename, signal, n_bits):
    depth = len(signal)
    with open(filename, 'w') as f:
        f.write("WIDTH={};\n".format(n_bits))
        f.write("DEPTH={};\n\n".format(depth))
        f.write("ADDRESS_RADIX=UNS;\n")
        f.write("DATA_RADIX=UNS;\n\n")
        f.write("CONTENT BEGIN\n")
        for i, val in enumerate(signal):
            f.write("    {} : {};\n".format(i, val))
        f.write("END;\n")

# Parameters
f0 = 50  # Fundamental frequency in Hz
fs = 16000  # Sampling frequency in Hz
duration = 5 * (1 / f0)  # Duration for 5 cycles
snr_db = 20  # Signal-to-Noise Ratio in dB

# Generate the signal
t, signal = generate_power_signal(f0, fs, duration, snr_db)

# Quantize the signal to 8-bit, 10-bit, and 12-bit
signal_8bit = quantize_signal(signal, 8)
signal_10bit = quantize_signal(signal, 10)
signal_12bit = quantize_signal(signal, 12)

# Plot the signals
plt.figure(figsize=(12, 6))
plt.plot(t, signal, label='Noisy Power Signal', alpha=0.5)
plt.plot(t, signal_8bit, label='8-bit Quantized Signal', alpha=0.7)
plt.plot(t, signal_10bit, label='10-bit Quantized Signal', alpha=0.7)
plt.plot(t, signal_12bit, label='12-bit Quantized Signal', alpha=0.7)
plt.title('Power Signal with Noise and Quantized Versions')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.legend()
plt.grid()
plt.show()

# Display first few samples for verification
print('First few samples (8-bit):', signal_8bit[:10])
print('First few samples (10-bit):', signal_10bit[:10])
print('First few samples (12-bit):', signal_12bit[:10])

# Write the data to .mif files
write_mif_file('signal_8bit.mif', signal_8bit, 8)
write_mif_file('signal_10bit.mif', signal_10bit, 10)
write_mif_file('signal_12bit.mif', signal_12bit, 12)
