package ex;

public class Car {

	int gasolinegauge;

	Car(int gas) {
		this.gasolinegauge = gas;
	}

	Car() {

	}
}

class HybridCar extends Car {
	int electronicGauge;

	HybridCar(int gas, int eg) {
		super(gas);
		electronicGauge = eg;

	}

	HybridCar(int gas) {
		super(gas);

	}
}

class HybridWaterCar extends HybridCar {
	int waterGauge;

	HybridWaterCar(int gg, int eg, int wg) {
		super(gg, eg);
		waterGauge = wg;
	}
	HybridWaterCar(int gg, int eg) {
		super(gg, eg);
	}
	HybridWaterCar(int gg) {
		super(gg);
	}

	public void showCurrentGauge() {
		System.out.println("잔여 가솔린 : " + gasolinegauge);
		System.out.println("잔여 가솔린 : " + electronicGauge);
		System.out.println("잔여 가솔린 : " + waterGauge);
	}
}
