import pandas as pd
import matplotlib.pyplot as plt

crimes = pd.read_csv("C:/Users/Asus/Downloads/workspace/crimes.csv", dtype={"TIME OCC": str})
print(crimes.head())

# Which hour has the highest frequency of crimes? Store as an integer variable called peak_crime_hour.
crimes['HOUR'] = crimes['TIME OCC'].astype(int) //100
peak_crime_hour=int(crimes['HOUR'].mode()[0])

crimes['HOUR'].value_counts().sort_index().plot(kind='bar')
plt.xlabel('Hour of Day')
plt.ylabel('Number of Crimes')
plt.title('Crimes by Hour')
plt.show()


# Which area has the largest frequency of night crimes (crimes committed between 10pm and 3:59am)?
# Save as a string variable called peak_night_crime_location.
night=[22, 23, 0, 1, 2, 3]
night_crimes = crimes[crimes['HOUR'].isin(night)]
peak_night_crime_location = night_crimes['AREA NAME'].value_counts().idxmax()

night_crimes['AREA NAME'].value_counts().plot(kind='bar', figsize=(8,4))
plt.xlabel('Area Name')
plt.ylabel('Number of Night Crimes')
plt.title('Night Crimes by Area (10PM to 3:59AM)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()


# Identify the number of crimes committed against victims of different age groups.
# Save as a pandas Series called victim_ages, with age group labels
# "0-17", "18-25", "26-34", "35-44", "45-54", "55-64", and "65+"
# as the index and the frequency of crimes as the values.
age = crimes['Vict Age'].dropna()
def categorize_age(age):
    if age <= 17:
        return '0-17'
    elif age <= 25:
        return '18-25'
    elif age <= 34:
        return '26-34'
    elif age <= 44:
        return '35-44'
    elif age <= 54:
        return '45-54'
    elif age <= 64:
        return '55-64'
    else:
        return '65+'

crimes['Age Group'] = age.apply(categorize_age)
victim_ages = crimes['Age Group'].value_counts().sort_index()

victim_ages.plot(kind='bar', color='skyblue')
plt.xlabel('Age Group')
plt.ylabel('Number of Crimes')
plt.title('Crimes by Victim Age Group')
plt.show()