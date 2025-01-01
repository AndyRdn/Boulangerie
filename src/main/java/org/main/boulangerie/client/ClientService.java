package org.main.boulangerie.client;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ClientService {
    private final ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public List<Client> getAll() {
        return clientRepository.findAll();
    }

    public Client getById(Integer id) {
        return clientRepository.findById(id).orElseThrow(() -> new RuntimeException("Client not found"));
    }

    public void save(Client client) {
        clientRepository.save(client);
    }

    public void update(Integer id, String nom, LocalDate daty) {
        Client client = clientRepository.findById(id).orElse(null);
        if (client != null) {
            client.setNom(nom);
            client.setDaty(daty);
            clientRepository.save(client);
        }
    }

    public void delete(Integer id) {
        clientRepository.deleteById(id);
    }
}
