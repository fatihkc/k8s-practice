describe('response status is 200', () => {
    it('GET', () => {
        cy.request('GET', 'http://44.210.226.212:30000')
        .then((res) => {expect(res).to.have.property('status', 200)
        })        
    })
})

describe('response body is not null', () => {
    it('GET', () => {
        cy.request('GET', 'http://44.210.226.212:30000')
        .then((res) => {expect(res.body).to.not.be.null
        })        
    })
})