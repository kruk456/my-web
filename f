<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Obliczanie Średniej Ważonej</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f7f7f7;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #0056b3;
            color: #fff;
        }
        .result {
            font-weight: bold;
            text-align: center;
            font-size: 1.2em;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        button {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            margin-bottom: 10px;
        }
        button:hover {
            background-color: #004494;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Obliczanie Średniej Ważonej</h1>
        <table>
            <thead>
                <tr>
                    <th>Oceny (oddzielone przecinkami)</th>
                    <th>Waga</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" id="grades1" placeholder="np. 1,4,2,6,4"></td>
                    <td><input type="number" id="weight1" value="1" step="1" min="1" max="3"></td>
                </tr>
                <tr>
                    <td><input type="text" id="grades2" placeholder="np. 2,5,3,7,5"></td>
                    <td><input type="number" id="weight2" value="2" step="1" min="1" max="3"></td>
                </tr>
                <tr>
                    <td><input type="text" id="grades3" placeholder="np. 3,6,4,8,6"></td>
                    <td><input type="number" id="weight3" value="3" step="1" min="1" max="3"></td>
                </tr>
            </tbody>
        </table>
        <button onclick="generateRandomGrades()">Generuj Losowe Oceny</button>
        <button onclick="calculateWeightedAverage()">Oblicz Średnią Ważoną</button>
        <p class="result" id="result"></p>
    </div>

    <script>
        function generateRandomGrades() {
            for (let i = 1; i <= 3; i++) {
                let randomGrades = Array.from({length: 5}, () => (Math.random() * 5 + 1).toFixed(2));
                document.getElementById(`grades${i}`).value = randomGrades.join(',');
            }
        }

        function calculateWeightedAverage() {
            let sumGrades = 0;
            let sumWeights = 0;

            for (let i = 1; i <= 3; i++) {
                let gradesInput = document.getElementById(`grades${i}`).value;
                let weight = parseInt(document.getElementById(`weight${i}`).value);

                let grades = gradesInput.split(',').map(item => parseFloat(item.trim().replace(',', '.')));

                if (grades.some(isNaN) || isNaN(weight)) {
                    document.getElementById("result").innerText = "Błędne dane wejściowe.";
                    return;
                }

                grades.forEach(grade => {
                    sumGrades += grade * weight;
                    sumWeights += weight;
                });
            }

            let weightedAverage = sumGrades / sumWeights;
            document.getElementById("result").innerText = `Średnia Ważona: ${weightedAverage.toFixed(2)}`;
        }
    </script>
</body>
</html>
