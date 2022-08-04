import { Button, Form, Input } from 'antd';
import React from 'react';
import 'antd/dist/antd.css';

const VerificationForm = () => {
  const onFinish = (values) => {
    console.log('Success:', values);
  };

  const onFinishFailed = (errorInfo) => {
    console.log('Failed:', errorInfo);
  };

  return (
    <Form
      name="basic"
      initialValues={{
        remember: true,
      }}
      onFinish={onFinish}
      onFinishFailed={onFinishFailed}
      autoComplete="off"
      className='form'
    >
      <Form.Item
        name="trnxHash"
        rules={[
          {
            required: true,
            message: 'Please enter your certificate transaction hash!',
          },
        ]}
      >
        <Input />
      </Form.Item>
      <Form.Item>
        <Button type="primary" htmlType="submit">
          Validate
        </Button>
      </Form.Item>
    </Form>
  );
};

export default VerificationForm;