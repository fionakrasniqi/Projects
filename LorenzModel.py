import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator
from scipy.integrate import solve_ivp
import numpy as np
import pandas as pd

#-----------PROCCESING------------------------------------------------------------------------------

weather_data = pd.read_csv("C:/Users/Asus/Downloads/GlobalWeatherRepository.csv")

print(weather_data.info())
print(weather_data.head())


print("#-----------------------------------------------------------------------------------------")
print("Filter for Albania")
print("#-----------------------------------------------------------------------------------------")

albania_data = weather_data[weather_data["country"] == "Albania"]
albania_data = albania_data[["location_name", "latitude", "longitude", "temperature_celsius","humidity", "pressure_mb", "last_updated"]]

print(albania_data.head())
print(albania_data.describe())


print("#-----------------------------------------------------------------------------------------")
print("Normalazing")
print("#-----------------------------------------------------------------------------------------")


from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler()
normalized_data = albania_data.copy()
normalized_data[["temperature_celsius", "humidity", "pressure_mb"]] = scaler.fit_transform(
    albania_data[["temperature_celsius", "humidity", "pressure_mb"]])

print(normalized_data.head())

normalized_data.to_csv("normalized_data.csv", index=False)
print("Normalized data saved to 'normalized_data.csv'")
#-----------END OF PROCCESING------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------------------

normalized_data = pd.read_csv("normalized_data.csv")

sigma, rho, beta = 10, 28, 8 / 3

#sistemi i Lorenz
def lorenz(t, state, sigma, rho, beta):
    x, y, z = state
    dxdt = sigma * (y - x)
    dydt = x * (rho - z) - y
    dzdt = x * y - beta * z
    return [dxdt, dydt, dzdt]
#Zgjidhja e ekuacioneve diferenciale
def solve_lorenz(initial_condition, time_span, time_points):
    return solve_ivp(lorenz, time_span, initial_condition, t_eval=time_points, args=(sigma, rho, beta))
#butterfly
def plot_lorenz_3d(solution, title="Lorenz Attractor- Albania's Weather (May 2024-January 2025)"):
    fig = plt.figure(figsize=(10, 7))
    ax = fig.add_subplot(projection='3d')
    ax.plot(solution.y[0], solution.y[1], solution.y[2], lw=0.5, label="Trajectory")
    ax.set_title(title, fontsize=14)
    ax.set_xlabel("X (Temperature)")
    ax.set_ylabel("Y (Humidity)")
    ax.set_zlabel("Z (Pressure)")
    ax.legend()
    plt.tight_layout()
    plt.show()
#krahasimi i pare
def compare_solutions(time_points, solution1, solution2, labels, title="Comparison"):
    plt.figure(figsize=(12, 6))
    plt.plot(time_points, solution1.y[0], label=labels[0], color="blue", linestyle="-")
    plt.plot(time_points, solution2.y[0], label=labels[1], color="red", linestyle="--")
    plt.title(title, fontsize=14)
    plt.xlabel("Time", fontsize=12)
    plt.ylabel("X (Temperature)", fontsize=12)
    plt.legend(fontsize=10)
    plt.grid(alpha=0.4)
    plt.tight_layout()
    plt.show()
#zoomed
def plot_zoomed_comparison(time_points, solution1, solution2, labels, zoom_range, title="Zoomed-In Comparison"):
    zoom_indices = (time_points >= zoom_range[0]) & (time_points <= zoom_range[1])
    plt.figure(figsize=(12, 6))
    plt.plot(time_points[zoom_indices], solution1.y[0][zoom_indices], label=labels[0], color="blue", linestyle="-")
    plt.plot(time_points[zoom_indices], solution2.y[0][zoom_indices], label=labels[1], color="red", linestyle="--")
    plt.title(title, fontsize=14)
    plt.xlabel("Time", fontsize=12)
    plt.ylabel("X (Temperature)", fontsize=12)
    plt.legend(fontsize=10)
    plt.grid(alpha=0.4)
    plt.tight_layout()
    plt.show()

#kushtet fillestare
initial_condition = normalized_data.iloc[0][["temperature_celsius", "humidity", "pressure_mb"]].values
#ndryshimi i tem per +0.001
perturbed_condition = initial_condition + np.array([0.01, 0, 0])

time_span = (0, 50)
time_points = np.linspace(0, 50, 10000)

original_solution = solve_lorenz(initial_condition, time_span, time_points)
perturbed_solution = solve_lorenz(perturbed_condition, time_span, time_points)

### Plotting
plot_lorenz_3d(original_solution, title="Lorenz Attractor - Albania's Weather (May 2024-January 2025)")

compare_solutions(
    time_points,
    original_solution,
    perturbed_solution,
    labels=["Original", "Modified"],
    title="Butterfly Effect - Albania Weather (May 2024-January 2025)")

plot_zoomed_comparison(
    time_points,
    original_solution,
    perturbed_solution,
    labels=["Original", "Modified"],
    zoom_range=(10, 20),
    title="Zoomed-In Butterfly Effect - Albania Weather (May 2024-January 2025)")
