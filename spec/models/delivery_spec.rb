require 'rails_helper'

RSpec.describe Delivery, type: :model do
  let(:route) { Route.create!(name: "Ruta de Prueba", code: "R001") }
  let(:trip) { Trip.create!(route: route, driver_name: "Carlos Barboza", vehicle_plate: "AAA123", status: :active) }


  describe "validations" do
    it "Es valido todos los atributos requeridos" do
      delivery = Delivery.new(
        trip: trip,
        status: :pending,
        scheduled_at: Time.current + 1.hour,
        attempts_number: 0
      )
      expect(delivery).to be_valid
    end

    it "Es invalido el numero de intentos porque es negativo" do
      delivery = Delivery.new(
        trip: trip,
        status: :pending,
        scheduled_at: Time.current,
        attempts_number: -1
      )
      expect(delivery).not_to be_valid
    end
  end

  describe "#mark_completed!" do
    it "Marcar la entrega como completada" do
      delivery = Delivery.create!(
        trip: trip,
        status: :in_transit,
        scheduled_at: Time.current,
        attempts_number: 1
      )
      delivery.mark_completed!(recipient_name: "Juan Perez", notes: "Entregado sin problemas")
      expect(delivery.completed?).to be true
      expect(delivery.completed_at).not_to be_nil
      expect(delivery.recipient_name).to eq("Juan Perez")
      expect(delivery.notes).to eq("Entregado sin problemas")
    end
  end
end
