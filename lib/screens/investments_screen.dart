import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23286B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // abrir menu lateral
          },
        ),
        title: const Text(
          'Investimentos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Investimentos (baixo risco)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    investmentCard('99 Pay', '110%', 'Bônus (até 45%)', Colors.yellow),
                    investmentCard('Banco BMG', '120%', 'Liquidez diária', Colors.orange),
                    investmentCard('Neon Pagamento', '113%', 'CDI', Colors.lightBlueAccent),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Investimentos (medio risco)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    mediumRiskCard('XPML11', '105.88%', 'FII'),
                    mediumRiskCard('Tesouro Direto', '9.77%', 'Pós-Fixado'),
                    mediumRiskCard('Daycoval', 'CDI+', 'Renda Fixa'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dinheiro investido',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      gridData: FlGridData(show: true),
                      borderData: FlBorderData(show: false),
                      groupsSpace: 12,
                      baselineY: 0,
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                      ),
                      barGroups: _createHorizontalBarGroups(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createHorizontalBarGroups() {
    final data = [
      InvestmentData('Baixo', 11, Colors.green),
      InvestmentData('Médio', 5, Colors.amber),
      InvestmentData('Alto', 4, Colors.redAccent),
    ];

    return List.generate(data.length, (index) {
      final item = data[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: item.value.toDouble(),
            color: item.color,
            width: 20,
            borderRadius: BorderRadius.circular(4),
            rodStackItems: [],
            fromY: 0,
          ),
        ],
      );
    });
  }

  static Widget investmentCard(String title, String cdi, String detail, Color color) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(cdi, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(detail, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget mediumRiskCard(String title, String rate, String type) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
          const SizedBox(height: 8),
          Text(rate, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF23286B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Saiba mais >>',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestmentData {
  final String risk;
  final int value;
  final Color color;

  InvestmentData(this.risk, this.value, this.color);
}
